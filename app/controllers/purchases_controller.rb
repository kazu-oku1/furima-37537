class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_delivery = PurchaseDelivery.new
    @item = Item.find(params[:user_id])
  end

  def new
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_paramas
    params.require(:purchase_delivery).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number,).merge(user_id:current_user.id)
  end
end
