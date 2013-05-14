class Review < ActiveRecord::Base
  attr_accessible :content, :movie_id, :rating, :user_id

  validates :movie_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating
  validates :content, presence: true, length: {minimum: 5, maximum: 500}
end
