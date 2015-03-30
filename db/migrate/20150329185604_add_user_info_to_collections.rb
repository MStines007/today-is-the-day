class AddUserInfoToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :to_name, :string
  	add_column :collections, :to_email, :string
  	add_column :collections, :from_name, :string
  	add_column :collections, :from_email, :string
  end
end
