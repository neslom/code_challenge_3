class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
