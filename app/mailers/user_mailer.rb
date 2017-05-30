class UserMailer < ApplicationMailer

	default from: 'bikeshopnew@gmail.com'


	def contact_form(email, name, message)
  	@message = message
  	@email = email
  	@name = name
    mail(from: email,
         to: 'bikeshopnew@gmail.com',
         subject: "A new contact form message from #{name}, #{email} ")
  	end

#  	def thank_you
 # 	@name = params[:name]
  #	@email = params[:email]
 # 	@message = params[:message]
#  	UserMailer.contact_form( @email, @name, @message).deliver_now
#	end
end

