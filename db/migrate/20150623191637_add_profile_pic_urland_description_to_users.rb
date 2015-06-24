class AddProfilePicUrlandDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture_url, :text
    add_column :users, :description, :text
  end
end
