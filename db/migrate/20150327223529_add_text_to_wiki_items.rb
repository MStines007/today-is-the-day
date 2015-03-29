class AddTextToWikiItems < ActiveRecord::Migration
  def change
    add_column :wiki_items, :text, :string
  end
end
