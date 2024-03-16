class CheckoutsController < ApplicationController
  before_action :generate_item_hash, :fetch_pricings, only: :total_bill

  def index
    @items = Item.all
    render json: {items: @items}
  end

  def total_bill
    total = CheckoutService.new(@pricings, @items).fetch_total_price
    render json: {total: total}
  end

  private

  def generate_item_hash
    @items = params[:items].tally
  end

  def fetch_pricings
    @pricings = Pricing.all
  end
end
