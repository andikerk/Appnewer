require 'rails_helper'

describe Comment do

	before do
		@product= Product.create!(name: "Will", description: "good bike", price: 234)
		@user = User.create!(username: "Olli", email: "olli@olli", password: "olliolli")
	end

	it "is valid" do
		expect(@product.comments.new(user_id:@user.id, rating: 1, body: "poor")).to be_valid
	end
end