require 'rails_helper'

describe User do

	

	
	context "Check wether ordinary user is valid"
	it "is  valid" do
		@user = FactoryGirl.build(:user)
		expect(@user).to be_valid
	end



	context "username, email, password present"
	#let (:user) {User.new(username:"joe", email:"joe@joe.com", password: "joejoe")}
	
	it "is valid" do
		@user = FactoryGirl.build(:user, first_name:"", last_name:"")
		expect(@user).to be_valid
	end

	context "password too short"
#	let (:user) {User.new(username:"doe", email:"doe@doe.info", password: "doedo")}
		
	it "is not valid" do
		@user = FactoryGirl.build(:user, password: "rst88")
		expect(@user).not_to be_valid
	end



	context "email lacks @"
	it "is not valid" do
		#expect(User.new(username:"joe", email:"joejoe.com", password: "joejoe")).not_to be_valid
		@user = FactoryGirl.build(:user, email: "ama.omo.com")
		expect(@user).not_to be_valid
	end



	context "no username"
	it "is not valid" do
		#expect(User.new(username:"", email:"joe@joe.com",  password: "joejoe")).not_to be_valid
		@user = FactoryGirl.build(:user, username:"")
		expect(@user).not_to be_valid
	end
end