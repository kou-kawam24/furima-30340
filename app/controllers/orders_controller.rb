class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(postal_cord: postal_cord, prefecture: prefecture, city: city, address: address, building: building, phone_num: phone_num).merge(user_id: current_user.id, item_id: current_item.id)
  end
end
