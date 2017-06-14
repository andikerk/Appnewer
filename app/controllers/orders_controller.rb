
class OrdersController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => :show

  def index
    if current_user.admin?
        @order = Order.all
    end
  end

  def show
  
    @order = Order.find(params[:id])
    if @order.user == current_user
       @product = Product.find(@order.product_id)

    else
      redirect_to root_path, notice: "You are not authorized to access this page"
    end
  end

end
