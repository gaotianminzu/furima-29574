class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @transaction = Transaction.new
    if @item.purchase_record.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end
