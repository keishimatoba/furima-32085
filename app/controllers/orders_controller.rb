class OrdersController < ApplicationController


  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(order_params)
      if @purchase.valid?
         @purchase.save
         redirect_to root_path
      else
        render :index
      end

  end

  private

    def order_params
      params.require(:purchase).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
