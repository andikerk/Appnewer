class PaymentsController < ApplicationController

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
		redirect_to order_path@order
		end
		

		flash[:success] = "Payment processed successfully"
		
	rescue Stripe::CardError => e
		# The card has been declined
		body = e.json_body
		err  = body[:error]
		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

		redirect_to product_path
	end

	
	

 end

end