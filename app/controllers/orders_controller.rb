class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @purchase = Purchase.new
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @purchase = Purchase.new(order_params)
      if @purchase.valid?
         pay_item
         @purchase.save
         redirect_to root_path
      else
        render :index
      end

  end

    private

    def set_order
      @item = Item.find(params[:item_id])  
    end

    def order_params
      params.require(:purchase).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
    end

    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'              
    )
    end

end
