class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.datetime :date

      t.timestamps null: false
    end
  end
end
