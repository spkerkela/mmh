class Movie < ActiveRecord::Base
  attr_accessible :actors, :director, :genre, :imdbid, :imdbrating, :imdbvotes, :plot, :rated, :released, :runtime, :title, :writer, :year
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :year, presence: true

  default_scope order: 'movies.title ASC'
end
