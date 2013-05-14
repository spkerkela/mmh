FactoryGirl.define do
	factory :user do
		# This way each call to create a new user with factorygirl
		# creates a unique user
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n|"person#{n}@mail.com" }
		password "12341234"
		password_confirmation "12341234"
	end
end