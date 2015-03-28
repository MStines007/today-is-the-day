class AddContentToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :headline, :string
    add_column :news_items, :snippet, :string
    add_column :news_items, :link, :string
  end
end
