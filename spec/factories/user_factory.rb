FactoryGirl.define do |variable|

	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		    email 
		    password "1234567890"
		    username "tim"
		    first_name "Tim"
		    last_name "Tom"
			admin false
	end

	factory :user2, class: User do
			email 
			password "3494jdflld"
			username "jerry"
		    first_name "Jerry"
		    last_name  "Jam"
		    admin false
	end

	factory :admin, class: User do
			email 
			password "34zuedbs"
			username "jadmin"
		    first_name "John"
		    last_name  "Doe"
		    admin true
	end
end