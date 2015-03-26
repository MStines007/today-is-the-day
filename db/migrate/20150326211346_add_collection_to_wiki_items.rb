class AddCollectionToWikiItems < ActiveRecord::Migration
  def change
    add_column :wiki_items, :collection_id, :integer
  end
end
