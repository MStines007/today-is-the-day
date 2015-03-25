class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.datetime :date
    end
  end
end
