
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
def create_item
  Item.create(sku: "A", unit_price:"50")
  Item.create(sku: "B", unit_price:"30")
  Item.create(sku: "C", unit_price:"20")
  Item.create(sku: "D", unit_price:"15")
end

def create_pricing
  Pricing.create(item_id: 1, bulk_price:"130", bulk_quantity: 3)
  Pricing.create(item_id: 2, bulk_price:"45", bulk_quantity: 2)
  Pricing.create(item_id: 3, bulk_price:"0", bulk_quantity: 1)
  Pricing.create(item_id: 4, bulk_price:"0", bulk_quantity: 1)
end

create_item
create_pricing