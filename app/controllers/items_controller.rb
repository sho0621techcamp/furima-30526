class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if (user_signed_in? && current_user.id == @item.user_id) && @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :status_id, :shipping_fee_id, :shipping_region_id, :shipping_day_id, :price
    )
          .merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
