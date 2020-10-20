class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  before_action :authenticate_user!, only:[:index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:order_address)
    .permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number)
    .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card:   order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    
    elsif @item.order != nil
      redirect_to root_path
    end
  end
end
