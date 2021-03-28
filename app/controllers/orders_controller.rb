class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
       @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:item_id, :post_code, :placeshipment_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
