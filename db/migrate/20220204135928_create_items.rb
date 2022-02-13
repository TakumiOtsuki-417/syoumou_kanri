class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.integer :genre_id, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :from_id, null: false
      t.text :comment 
      t.timestamps
    end
  end
end