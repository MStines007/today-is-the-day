class CreateWikiHolidayItems < ActiveRecord::Migration
  def change
    create_table :wiki_holiday_items do |t|
      t.datetime :date
      t.integer :collection_id
      t.string :holiday

      t.timestamps null: false
    end
  end
end
