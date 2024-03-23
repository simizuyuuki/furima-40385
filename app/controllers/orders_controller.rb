class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @record_ship_address = RecordShipAddress.new
    return unless @item.user == current_user

    redirect_to root_path, notice: 'Item was successfully deleted.'
  end

  def create
    @record_ship_address = RecordShipAddress.new(record_params)
    if @record_ship_address.valid?
      pay_item
      @record_ship_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record_ship_address).permit(:post_code, :prefectur_id, :municipalities, :address, :building, :telephone)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
