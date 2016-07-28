class CreateWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workspaces do |t|
      t.string :title
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
