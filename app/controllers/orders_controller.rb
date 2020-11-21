class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:new, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postcode, :region_id, :city, :block, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],   
      currency: 'jpy'                
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    @item = Item.find(params[:item_id]) 
    unless user_signed_in? && current_user.id != @item.user_id && @item.purchase_record == nil
    redirect_to root_path 
    end
  end

end
