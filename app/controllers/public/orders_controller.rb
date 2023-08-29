class Public::OrdersController < ApplicationController
 def index
 end

 def new
  @order = Order.new
 end

 def create

 end

 def confirm
  @order = Order.new(order_params)
 end

 private
 def order_params
  params.require(:order).permit(:payment_method)
 end
end
