# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    movie_id 1
    user_id 1
    rating 1.5
    content "MyText"
  end
end
