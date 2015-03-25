class CreateCollectionOfBdayTrivias < ActiveRecord::Migration
  def change
    create_table :collection_of_bday_trivias do |t|
      t.datetime :date
    end
  end
end
