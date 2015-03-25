class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.datetime :date
    end
  end
end
