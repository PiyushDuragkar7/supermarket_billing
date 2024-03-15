class Pricing < ApplicationRecord
  belongs_to :item

  def fetch_item_value(items)
    total_price = 0 
    items.each do |key, quantity|
      if quantity > bulk_quantity
        total_price += unit_price * quantity
      end
      if quantity <= bulk_quantity
        total_price += ((unit_price * quantity) * (quantity / bulk_quantity) ) + (unit_price * (quantity % bulk_quantity))
      end
    end
    puts total_price
  end

  def fetch_price(quantity)

  end
end
