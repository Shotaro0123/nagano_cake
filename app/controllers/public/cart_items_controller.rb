class Public::CartItemsController < ApplicationController
 def index
 end

 def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.user.id = current_user.id
  @cart_item.save
  redirect_to cart_item_path
 end

 private

 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end
end
