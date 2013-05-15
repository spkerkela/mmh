# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  user_id    :integer
#  rating     :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "should save with valid inputs" do
    review = Review.new
    review.id = 1
    review.user_id = 1
    review.movie_id = 1
    review.rating = 5
    review.content ="ihan ok ja jees"
    assert review.valid?
    assert review.save
    
  end
  
  test "should not save with same user_id and movie_id" do
    review = Review.new
    review.id = 1
    review.user_id = 1
    review.movie_id = 1
    review.rating = 5
    review.content ="ihan ok ja jees"
    review.save
    
    review2 = Review.new
    review2.id = 2
    review2.user_id = 1
    review2.movie_id = 1
    review2.rating = 5
    review2.content ="ihan ok ja jees"
    
    assert review2.invalid?
    assert !review2.save
    
  end
  
  test "should not save without user_id or rating" do
    review = Review.new
    review.id = 1
    #review.user_id = 1
    review.movie_id = 1
    #review.rating = 5
    review.content ="ihan ok ja jees"
    assert review.invalid?
    assert !review.save
    
  end
  
  
  
  # test "the truth" do
  #   assert true
  # end
end
