FactoryGirl.define do |variable|

	factory :user do
		    email "tim@oxample.com"
		    password "1234567890"
		    username "tim"
		    first_name "Tim"
		    last_name "Tom"
			admin false
	end

	factory :user2, class: User do
			email "jerry@example.com"
			password "3494jdflld"
			username "jerry"
		    first_name "Jerry"
		    last_name  "Jam"
		    admin false
	end

	factory :admin, class: User do
			email "admin@example.com"
			password "34zuedbs"
			username "jadmin"
		    first_name "John"
		    last_name  "Doe"
		    admin true
	end
end