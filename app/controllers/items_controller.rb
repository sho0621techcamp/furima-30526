class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
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

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :status_id, :shipping_fee_id, :shipping_region_id, :shipping_days_id, :price
    )
          .merge(user_id: current_user.id)
  end
end
