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
    
 
  def thankyou(user, product, order)
    @user = user
    @product = product
    @order = order
    mail(to: @user.email, subject: 'Thank You for Shopping with Us!')
  end

end

