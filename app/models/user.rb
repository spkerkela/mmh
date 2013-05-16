# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy

  # For following other users
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  # The source here tells rails that this array should be made of "followed" id's
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy

  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { |user| user.email = email.downcase}
  validates :name, presence: true, length: {minimum: 3, maximum:100}, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def feed
  	Micropost.from_users_followed_by(self)
  end

  def following? (other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow! (other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow! (other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
