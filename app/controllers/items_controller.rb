class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :price, :image, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :ship_date_id)
  end
end
