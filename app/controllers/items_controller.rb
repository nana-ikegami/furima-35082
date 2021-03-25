class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order("created_at DESC")
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
    params.require(:item).permit(:name, :price, :category_id, :user_id, :descuription, :condition_id, :postagetype_id, :preparationday_id, :placeshipment_id, :image).merge(user_id: current_user.id)
  end

end
