class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.references :tag, index: true
      t.references :entry, index: true

      t.timestamps null: false
    end
    add_foreign_key :entry_tags, :tags
    add_foreign_key :entry_tags, :entries
  end
end
