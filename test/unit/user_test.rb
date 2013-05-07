# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should save with valid params" do
  	user = User.new
  	user.name = "Simppa"
  	user.email = "simo@example.com"
  	user.password = "12341234"
  	user.password_confirmation = "12341234"
  	assert user.valid?
  	assert user.save
  end

  test "should not save with no email" do
  	user = User.new
  	user.name = "Simppa"
  	user.email = ""
  	user.password = "12341234"
  	user.password_confirmation = "12341234"
  	assert user.invalid?
  	assert !user.save
  end

  test "should not save with invalid email" do
  	user = User.new
  	user.name = "Simppa"
  	user.email = "derp"
  	user.password = "12341234"
  	user.password_confirmation = "12341234"
  	assert user.invalid?
  	assert !user.save
  end

  test "should not save with non-unique email" do
  	v_email = "derp@email.com"
  	user = User.new(name: "myname", email: v_email, password:"12341234", password_confirmation:"12341234")
  	user.save
  	user2 = User.new(name: "otherdude", email: v_email, password:"12341234", password_confirmation:"12341234")
  	assert user2.invalid?
  	assert !user2.save
  end

  test "should not save with non-unique name" do
  	v_name ="testname"
  	user = User.new(name: v_name, email: "validemail1@email.com", password:"12341234", password_confirmation:"12341234")
  	user.save
  	user2 = User.new(name: v_name, email: "validemail2@email.com", password:"12341234", password_confirmation:"12341234")
  	assert user2.invalid?
  	assert !user2.save
  end

  test "should not save with too short password" do
  	user = User.new
  	user.name = "Name"
  	user.email = "derp@example.com"
  	user.password = "1234"
  	user.password_confirmation = "1234"
  	assert user.invalid?
  	assert !user.save
  end

  test "should not save without password confirmation" do
  	user = User.new
  	user.name = "Name"
  	user.email = "derp@example.com"
  	user.password = "12341234"
  	user.password_confirmation = ""
  	assert user.invalid?
  	assert !user.save
  end
end
