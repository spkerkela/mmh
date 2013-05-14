# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
  	@follower = FactoryGirl.create(:user)
  	@followed = FactoryGirl.create(:user)
  	@relationship = @follower.relationships.build(followed_id: @followed.id)
  end

  test "relationship should be valid" do
  	assert @relationship.valid?
  end

  test "should not be able to follow self" do
  	new_relationship = @follower.relationships.build(followed_id: @follower.id)
  	assert new_relationship.invalid?
  end
end
