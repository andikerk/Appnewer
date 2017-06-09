class PaymentsController < ApplicationController
before_action :authenticate_user!
	def create
	token = params[:stripeToken]
	@product = Product.find(params[:product_id])
	@user = current_user
	
	begin
		charge = Stripe::Charge.create(
			:amount => (@product.price), 
			:currency => "eur",
			:source => token,
			:receipt_email => "#{@user.email}",
			:description => "@product.name, @product_description"
			)
		

		if charge.paid
		@order = Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
		flash[:notice] = "Payment successful"
		session[:order_id] = @order.id
		redirect_to order_path(@order)
		UserMailer.thankyou(@user, @product, @order).deliver_now		
		end	
		
	rescue Stripe::CardError => e
		# The card has been declined
		body = e.json_body
		err  = body[:error]
		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		redirect_to product_path
	end

  end

end