class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] # :destroy, :edit]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge(user_id: current_user.id))
    if @item.save
      redirect_to root_path(@item), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  # def destroy
  # item = Item.find(params[:id])
  # item.destroy
  # redirect_to root_path
  # end

  def edit
    return if @item.user == current_user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :situation_id, :charge_id, :prefectur_id, :number_id,
                                 :price)
  end
  def find_item
    @item=Item.find(params[:id])
  end
end
