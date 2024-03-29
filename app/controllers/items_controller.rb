class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

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

  def destroy
    return unless @item.user == current_user

    @item.destroy
    redirect_to root_path, notice: 'Item was successfully deleted.'
  end

  def edit
    return unless @item.user != current_user || @item.record.present?

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
    params.require(:item).permit(:name, :description, :image, :category_id, :situation_id, :charge_id, :prefecture_id, :number_id,
                                 :price)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
