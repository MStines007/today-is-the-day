class AddFriendBdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friend_bday, :date
    add_column :users, :friend_name, :string
  end
end
