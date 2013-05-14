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
end
