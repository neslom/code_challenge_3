class AddDefaultOfOpenToMatch < ActiveRecord::Migration
  def change
    change_column_default :matches, :status, "open"
  end
end
