class ChangeWikiItemsTableName < ActiveRecord::Migration
  def change
    rename_table :wiki_items, :wiki_event_items
  end
end
