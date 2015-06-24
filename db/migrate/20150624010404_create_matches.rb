class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :user
      t.text :match_uid
      t.text :like

      t.timestamps null: false
    end
  end
end
