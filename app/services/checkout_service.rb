class CheckoutService

  def initialize(pricings, items)
    @pricings = pricings
    @items = items
  end

  def fetch_total_price
    total_price = 0
    @items.each do |key, value|
      total_price += fetch_item_value(key, value)
    end
    total_price
  end

  def fetch_item_value(item, count)
    return 0 if (item = Item.find_by(sku: item)).nil?

    fetch_pricing(item.id)
    if @pricing.present? && count >= @pricing.bulk_quantity
      bulk_price_count = count / @pricing.bulk_quantity
      extra_count = count % @pricing.bulk_quantity
      bulk_price_count * @pricing.bulk_price + extra_count * item.unit_price
    else
      count * item.unit_price
    end
  end

  def fetch_pricing(item_id)
    @pricing = @pricings.find_by(item_id: item_id)
  end
end