require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  def setup 
    @follower = User.new(
                     name: "erisnimi",
                     email: "example@ext.com",
                     password: "12341234",
                     password_confirmation: "12341234")

    @follower.save
   @followed =  User.new(
                     name: "erisnimi2",
                     email: "example2@ext.com",
                     password: "12341234",
                     password_confirmation: "12341234")

    @followed.save
  
  end

  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  test "testing creation" do
    login_as(@follower)
     assert_difference('Relationship.count') do
      post :create, :relationship => {followed_id: @followed.id}
    end
    assert_redirected_to users_path(assigns(:user))
  end

  test "should delete relationship" do
    login_as(@follower) 
    @relationship = @follower.relationships.build(followed_id: @followed.id)
    
    assert_difference('Relationship.count') do
#      post :create, :relationship => {followed_id: @relationship.followed_id}
      @relationship.save
    end
   # assert_difference('Relationship.count') do
   #   post :create, :relationship => {followed_id: @followed.id}
   # end
    relationship = Relationship.last()
   
    assert_difference('Relationship.count', -1) do
      delete :destroy, id: @relationship.id
    end
    
    
    assert_redirected_to users_path(assigns(:user))
  end


  # test "the truth" do
  #   assert true
  # end
end
