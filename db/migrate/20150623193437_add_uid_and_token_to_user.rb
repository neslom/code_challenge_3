class AddUidAndTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :text
    add_column :users, :token, :text
  end
end
