# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	
 def contact_form
    UserMailer.contact_form("john@example.com", "John", "Hello World!")
 end

 def thankyou
 	UserMailer.thankyou("john@example.com", "John", "Hello World!")
 end

 def welcome
 	UserMailer.welcome_mail("john@example.com", "John")
 end
end
