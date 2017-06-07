
class OrdersController < ApplicationController

  

  def index
    if current_user.admin?
  @order = Order.all
    end
  end

  def show
    if signed_in?
    @order = Order.where(user_id:current_user.id).last
    end
  end

  def new
  end

  def create
  end

  def destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:product_id, :user_id)
    end
end
