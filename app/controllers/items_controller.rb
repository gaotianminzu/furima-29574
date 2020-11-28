class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: :index 
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_place_id, :shipping_days_id, :cost, :image).merge(user_id: current_user.id)
  end
end
