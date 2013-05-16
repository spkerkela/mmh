# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "The best movie ever"
  	year "1990"
  	rated "asd"
  	released "MyString"
  	runtime "MyString"
  	genre "MyString"
  	director "MyString"
  	writer "MyString"
  	actors "MyString"
  	plot "MyText"
  	imdbrating 1.5
  	imdbvotes 1
  	imdbid "MyString"
  end
end
