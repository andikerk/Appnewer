require 'rails_helper'

describe Order do
	before do
		#@user=User.create!(username: "Bill", email: "bill@bill", password: "billbill")
		@user = FactoryGirl.create(:user)
		#@product=Product.create!(name:"Maria",description: "great bike", price:"229")
		@product = FactoryGirl.create(:product)
	end

	it "is valid" do
		expect(@order=Order.new(product_id:@product.id, user_id:@user_id)).to be_valid
	end

	
end