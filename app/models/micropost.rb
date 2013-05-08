# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates_presence_of :content
  validates :content, length: {minimum: 1, maximum: 255}
  
  default_scope order: 'created_at DESC' 
end
