require 'rails_helper'

describe User do

	before do

	@user1 = FactoryGirl.create (:user)
	end

	it "is  valid" do
		expect(@user1).to be_valid
	end
end



describe User do
	context "username, email, password present"
	let (:user) {User.new(username:"joe", email:"joe@joe.com", password: "joejoe")}

	it "is valid" do
		expect(user).to be_valid
	end
end

describe User do
	context "password too short"
	let (:user) {User.new(username:"doe", email:"doe@doe.info", password: "doedo")}

	it "is not valid" do
		expect(user).not_to be_valid
	end
end

describe User do
	context "email lacks @"
	it "is not valid" do
		expect(User.new(username:"joe", email:"joejoe.com", password: "joejoe")).not_to be_valid
	end
end

describe User do
	context "no username"
	it "is not valid" do
		expect(User.new(username:"", email:"joe@joe.com",  password: "joejoe")).not_to be_valid
	end
end