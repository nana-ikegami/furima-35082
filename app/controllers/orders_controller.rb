class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new
  end

  private

  def order_address_params
    params.require(:order_address).permit(:item_id, :post_code, :placeshipment_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
