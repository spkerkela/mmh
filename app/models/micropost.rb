# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates :user_id, presence: true
  validates_presence_of :content
  validates :content, length: {minimum: 1, maximum: 255}
  
  default_scope order: 'created_at DESC' 

  def self.from_users_followed_by(user)
  	followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
  	where("user_id IN (#{followed_user_ids}) or user_id = :user_id", user_id: user.id)
  	
  end
end
