class AddStatusToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :status, :text
  end
end
