class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :account, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :login, unique: true
  end
end
