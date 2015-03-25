class CreateWikiItems < ActiveRecord::Migration
  def change
    create_table :wiki_items do |t|
      t.datetime :date
    end
  end
end
