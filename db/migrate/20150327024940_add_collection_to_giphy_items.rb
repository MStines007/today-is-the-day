class AddCollectionToGiphyItems < ActiveRecord::Migration
  def change
    add_column :giphy_items, :collection_id, :integer
  end
end
