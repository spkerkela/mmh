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
require "pp"
require "json"


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

  def Movie.add_from_id id
    url_w_id = URI.encode("http://www.omdbapi.com/?i=#{id}&plot=full")
    temp_movie = JSON.parse HTTParty.get(url_w_id).response.body
    if temp_movie["Response"] == "True"
      new_movie = Movie.new
      new_movie.title = temp_movie["Title"]
      new_movie.writer =  temp_movie["Writer"]
      new_movie.director = temp_movie["Director"]
      new_movie.actors = temp_movie["Actors"]
      new_movie.genre = temp_movie["Genre"]
      new_movie.imdbid = temp_movie["imdbID"]
      new_movie.imdbrating = temp_movie["imdbRating"]
      new_movie.plot = temp_movie["Plot"]
      new_movie.rated = temp_movie["Rated"]
      new_movie.released = temp_movie["Released"]
      new_movie.poster = temp_movie["Poster"]
      new_movie.imdbvotes = temp_movie["imdbVotes"]
      new_movie.year = temp_movie["Year"]
      new_movie.runtime = temp_movie["Runtime"]
      new_movie.save
    end
  end
end
