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

class Review < ActiveRecord::Base
  attr_accessible :content, :movie_id, :rating, :user_id


  belongs_to :movie
  belongs_to :user

  validates_uniqueness_of :movie_id, scope: :user_id, message: "already has a review by your account."
  validates :movie_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :content, presence: true, length: {minimum: 5, maximum: 2000}
end
