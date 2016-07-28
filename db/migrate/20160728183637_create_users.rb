class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.references :account, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
