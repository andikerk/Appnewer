require  'rails_helper' 

  describe Product do 

	before do
	#here you put your code to generate test content
		
		@product = FactoryGirl.create(:product)
		@user = FactoryGirl.create(:user)

		@product.comments.create!(rating: 1, user: @user, body: "geht so")
		@product.comments.create!(rating: 3, user: @user, body: "na ja")
		@product.comments.create!(rating: 5, user: @user, body: "super")
	end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq(3)
	end

	it "is valid" do
		expect(Product.new(name: "john", price: 345,description:"everyday bike" )).to be_valid
	end

	it "is not valid" do
		expect(Product.new(description:"adsfasdf",price: -44, name: "Olli")).not_to be_valid
	end

	it "is not valid" do
		expect(Product.new(price: 35)).not_to be_valid 
	end

end
