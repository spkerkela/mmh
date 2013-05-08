# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
   test "mpost should save with valid params" do
    post = Micropost.new
    post.content = "DERP DERP DERP DERP"
    assert post.valid?
    assert post.save
  end

  test "mpost should not save with no content" do
    post = Micropost.new
    assert post.invalid?
    assert !post.save
  end
  
  test "mpost should not save with short content" do
    post = Micropost.new
    post.content = ""
   assert post.invalid?
    assert !post.save
  end
  
  test "mpost should not save with too long 256 content" do
    post = Micropost.new
    post.content = "x"*256
   assert post.invalid?
    assert !post.save
  end
  
  # test "the truth" do
  #   assert true
  # end
end
