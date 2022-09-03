class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(item_id: params[:item_id])
    redirect_to("/items/#{params[:item_id]}")
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
    redirect_to("/items/#{params[:item_id]}")
  end

  # private

  # def set_item
  #   @item = Item.find_by(id: params[:item_id])
  # end
end
