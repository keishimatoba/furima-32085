class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    # @item.image.build
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  # def move_to_index
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :postage_payer_id, :prefecture_code_id, :preparetion_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
