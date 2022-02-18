class CreateDamages < ActiveRecord::Migration[6.0]
  def change
    create_table :damages do |t|
      t.date :date, null: false
      t.integer :amount, null: false
      t.text :comment
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
