class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :wiki_items, :text, :event
  end
end
