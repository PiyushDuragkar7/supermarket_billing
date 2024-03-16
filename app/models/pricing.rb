class Pricing < ApplicationRecord
  belongs_to :item

  def fetch_price(quantity)

  end
end
