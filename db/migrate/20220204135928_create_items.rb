class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :genre, null: false
      t.date :day
      t.string :place
      t.text :comment 
      t.timestamps
    end
  end
end