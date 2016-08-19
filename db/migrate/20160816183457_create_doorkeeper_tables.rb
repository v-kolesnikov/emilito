class CreateDoorkeeperTables < ActiveRecord::Migration
  def change
    create_table :oauth_applications do |t|
      t.text    :name,         null: false
      t.text    :uid,          null: false
      t.text    :secret,       null: false
      t.text    :redirect_uri, null: false
      t.text    :scopes,       null: false, default: ''
      t.timestamps             null: false
    end

    add_index :oauth_applications, :uid, unique: true

    create_table :oauth_access_grants do |t|
      t.integer  :resource_owner_id, null: false
      t.references :application,     null: false
      t.text     :token,             null: false
      t.integer  :expires_in,        null: false
      t.text     :redirect_uri,      null: false
      t.datetime :created_at,        null: false
      t.datetime :revoked_at
      t.text   :scopes
    end

    add_index :oauth_access_grants, :token, unique: true
    add_foreign_key(
      :oauth_access_grants,
      :oauth_applications,
      column: :application_id
    )

    create_table :oauth_access_tokens do |t|
      t.integer  :resource_owner_id
      t.references :application

      t.text     :token, null: false

      t.text     :refresh_token
      t.integer  :expires_in
      t.datetime :revoked_at
      t.datetime :created_at, null: false
      t.text     :scopes

      # If there is a previous_refresh_token column,
      # refresh tokens will be revoked after a related access token is used.
      # If there is no previous_refresh_token column,
      # previous tokens are revoked as soon as a new access token is created.
      # Comment out this line if you'd rather have refresh tokens
      # instantly revoked.
      t.text     :previous_refresh_token, null: false, default: ""
    end

    add_index :oauth_access_tokens, :token, unique: true
    add_index :oauth_access_tokens, :resource_owner_id
    add_index :oauth_access_tokens, :refresh_token, unique: true
    add_foreign_key(
      :oauth_access_tokens,
      :oauth_applications,
      column: :application_id
    )
  end
end
