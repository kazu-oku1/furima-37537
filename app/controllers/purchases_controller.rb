class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_delivery = PurchaseDelivery.new
    @item = Item.find(params[:item_id])    
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
