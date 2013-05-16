# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  year       :string(255)
#  rated      :string(255)
#  released   :string(255)
#  runtime    :string(255)
#  genre      :string(255)
#  director   :string(255)
#  writer     :string(255)
#  actors     :string(255)
#  plot       :text
#  imdbrating :float
#  imdbvotes  :integer
#  imdbid     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poster     :text
#

class Movie < ActiveRecord::Base
  attr_accessible :actors, :director, :genre, :imdbid, :imdbrating, :imdbvotes, :plot, :rated, :released, :runtime, :title, :writer, :year, :poster
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :year, presence: true
  has_many :reviews, dependent: :destroy

  default_scope order: 'movies.title ASC'

  def avg_rating
  	if self.reviews.any?
  		total = 0.0
  		for r in self.reviews do
  			total += r.rating.to_f
  		end
  		return total/self.reviews.count
  	else
  		return nil
  	end
  end

  def reviewed_by(user)
    if not self.reviews.any?
      return false
    end
    for r in self.reviews do
      if r.user_id == user.id and r.movie_id == self.id
        return true
      end
    end
    return false
  end
end
