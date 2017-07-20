require 'rails_helper'

describe Comment do

	before do
		#@product= Product.create!(name: "Will", description: "good bike", price: 234)
		@product = FactoryGirl.create(:product)
		#@user = User.create!(username: "Olli", email: "olli@olli", password: "olliolli")
		@user = FactoryGirl.create(:user)
	end

	it "is valid" do
		expect(@product.comments.new(user_id:@user.id, rating: 1, body: "poor")).to be_valid
	end

	it "is not valid" do
		expect(@product.comments.new(user_id:@user.id, rating: 1, body: "")).not_to be_valid
	end

	it "is not valid" do
		expect(@product.comments.new(user_id:@user.id, rating: "", body: "great")).not_to be_valid
	end
end