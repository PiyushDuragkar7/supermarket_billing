class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :sku
      t.float :unit_price

      t.timestamps
    end
  end
end
