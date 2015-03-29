class CreateWikiBirthItems < ActiveRecord::Migration
  def change
    create_table :wiki_birth_items do |t|
      t.datetime :date
      t.integer :collection_id
      t.string :birth

      t.timestamps null: false
    end
  end
end
