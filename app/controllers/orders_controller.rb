class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :user_check, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :placeshipment_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
  
  def user_check
   if current_user == @item.user || @item.order.present?
      redirect_to root_path
   end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
