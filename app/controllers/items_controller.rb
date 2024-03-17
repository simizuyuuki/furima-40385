class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:update,:destroy,:edit]
  before_action :move_to_index, except: [:index, :show, :search]

  def  index
    
  end  

  def  new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge(user_id: current_user.id))
    if @item.save
      redirect_to root_path(@item), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end 
  end

   private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :situation_id, :charge_id, :prefectur_id, :number_id, :price, :user)
  end
end
