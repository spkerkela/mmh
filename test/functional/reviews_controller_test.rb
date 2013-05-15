require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
   def setup 
    @user = User.new(
                     name: "erisnimi",
                     email: "example@ext.com",
                     password: "12341234",
                     password_confirmation: "12341234")

    @user.save
    
    @movie = movies(:one)
    
  end

  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  
  test "should get new review" do
    login_as(@user)
    get :new, movie_id: @movie.id
    assert_response :success
  end
  

  
  test "should create a review" do
    login_as(@user)
 #  review1 = FactoryGirl.create(:review)
 #   post :create, review: {movie_id: review1.movie_id, user_id: review1.user_id, rating: review1.rating, content: review1.content}
    post :create, review: {movie_id: 1, user_id: 1, rating: 1.5, content: "testireview"}
    assert_equal "Review created", flash.now[:success]
    assert_redirected_to movies_path
  end
 
  # test "the truth" do
  #   assert true
  # end
end
