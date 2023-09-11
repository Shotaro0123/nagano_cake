class Public::OrdersController < ApplicationController
 def index
 end

 def new
  @order = Order.new
 end

 def create
  @order = Order.new(orders_params)
  @order.customer_id = current_customer.id
  @order.save!
  redirect_to　confirm_path
 end

 def confirm
  @order = Order.new(order_params)
  @order.postal_code = current_customer.postal_code
  @order.address = current_customer.address
  @order.name = current_customer.last_name
  @order.name = current_customer.first_name
  @cart_items = current_customer.cart_items.all
 end

 private
 def order_params
  params.require(:order).permit(:payment_method)
 end

 def orders_params
  params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
 end
end
