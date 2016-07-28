class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.references :workspace, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
