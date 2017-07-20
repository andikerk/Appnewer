class StaticPagesController < ApplicationController
  before_action :authenticate_user!, :except => [:about, :index, :contact, :thank_you, :landing_page, :imprint ]
  def index	
  end

  def about 	
  end

  def contact
  end
 
  def thank_you	 
	  @name = params[:name ] 
	  @email = params[:email]
	  @message = params[:message]

	  UserMailer.contact_form(@email, @name, @message).deliver_now	
  end

  def landing_page
  	@products = Product.limit(3)    #where("id%2=1").reverse
  end

  def imprint
  end
end
