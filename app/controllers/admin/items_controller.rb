class Admin::ItemsController < ApplicationController
 def index
 end

 def new
  @item = Item.new
 end

 def create
  @item = Item.new(item_params)
  @item.save
  redirect_to ""
 end

 private

 def item_params
  params.require(:item).permit(:name, :introduction, :price, :image)
 end
end
