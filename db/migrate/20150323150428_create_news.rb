class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.datetime :date
    end
  end
end
