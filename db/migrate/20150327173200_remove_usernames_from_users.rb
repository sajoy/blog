class RemoveUsernamesFromUsers < ActiveRecord::Migration
  def change

    remove_column :users, :username
    add_index :users, :email
  end
end
