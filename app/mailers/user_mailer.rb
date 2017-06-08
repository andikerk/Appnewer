class UserMailer < ApplicationMailer

	default from: 'zweiradeins@gmail.com'


	def contact_form(email, name, message)
  	@message = message
  	@email = email
  	@name = name
    mail(from: email,
         to: 'zweiradeins@gmail.com',
         subject: "A new contact form message from #{name}, #{email} ")
  	end
    
 
  def welcome_email(user)
    @user = user
    #   @id= #session[:id]
   # @order = Order.find(@id)
   # @product = product
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end

