class CreateGiphyItems < ActiveRecord::Migration
  def change
    create_table :giphy_items do |t|
      t.datetime :date
    end
  end
end
