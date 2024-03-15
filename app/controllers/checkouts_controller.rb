class CheckoutsController < ApplicationController
    before_action :generate_item_hash
  def index
    ids = Item.where(sku: @items.keys).ids
    Pricing.where(id: ids).each{|pricing| pricing.fetch_item_value(@items)}
    # render json: {data: pp}
  end

  private

  def generate_item_hash
    @items = params[:items].tally 
  end
end
