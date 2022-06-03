class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.index.include(:user)
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
    params.require(:item).permit(:title, :explanation, :image, :category_id, :condition_id, :postage_type_id, :prefecture_id,
                                 :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
