class AddCollectionToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :collection_id, :integer
  end
end
