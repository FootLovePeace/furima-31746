class OrdersController < ApplicationController
  def index
    @item_purchase = ItemPurchase.new
    @item = Item.find(params[:item_id]) 
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id]) 
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postcode, :region_id, :city, :block, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
