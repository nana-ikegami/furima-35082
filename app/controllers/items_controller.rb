class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :user_id, :descuription, :condition_id, :postagetype_id,
                                 :preparationday_id, :placeshipment_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
