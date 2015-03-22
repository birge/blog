class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.references :entry, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :entries
  end
end
