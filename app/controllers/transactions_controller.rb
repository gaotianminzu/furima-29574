class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    if PurchaseRecord.where(item_id: @item.id).exists?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    else
      render action: :index
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(order_params)

    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:transaction).permit(:postal_code, :prefecture, :city_town_villages, :house_num, :building_name, :phone_number, :cost).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:cost],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
