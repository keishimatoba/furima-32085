class OrdersController < ApplicationController


  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
