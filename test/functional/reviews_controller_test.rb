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
    movie = FactoryGirl.create(:movie)
    post :create, review: {movie_id: movie.id, user_id: @user.id, rating: 1.5, content: "testireview"}
    assert_equal "Review created", flash.now[:success]
    assert_redirected_to movie
  end
 
  # test "the truth" do
  #   assert true
  # end
end
