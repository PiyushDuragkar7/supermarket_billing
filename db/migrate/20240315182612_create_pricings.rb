class CreatePricings < ActiveRecord::Migration[7.1]
  def change
    create_table :pricings do |t|
      t.integer :item_id
      t.float :unit_price
      t.float :bulk_price
      t.integer :bulk_quantity

      t.timestamps
    end
  end
end
