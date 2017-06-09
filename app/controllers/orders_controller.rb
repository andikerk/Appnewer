
class OrdersController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => :show

  def index
    if current_user.admin?
  @order = Order.all
    end
  end

  def show
    @id= session[:order_id]
    @order = Order.find(@id)
    #@product = Product.find(params[:product_id])
    @product=Product.find(@order.product_id)
  end


end
