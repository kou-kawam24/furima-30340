class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :price, :image, :category_id, 
      :condition_id, :shipping_fee_id, :shipping_area_id, :ship_date_id).merge(user_id: current_user.id)
  end
end
