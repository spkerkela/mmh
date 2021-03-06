require "pp"
require "json"

class MoviesController < ApplicationController

	before_filter :find_movie, only: [:show, :destroy]
	skip_before_filter :require_login, only: [:movie_search]
	def new
		@movie = Movie.new
	end

	def movie_search
		@mv = Movie.new
		moviename = params[:movie].downcase
		# this is the url if a moviename is given
		url = URI.encode("http://www.omdbapi.com/?t=#{moviename}&plot=full")

		# this is the url if an imdb id is given, tried after the movie
		url_w_id = URI.encode("http://www.omdbapi.com/?i=#{moviename}&plot=full")
		@movie = JSON.parse HTTParty.get(url).response.body

		if @movie["Response"] == "True"
			extract_variables
		else
			@movie = JSON.parse HTTParty.get(url_w_id).response.body
			if @movie["Response"] == "True"
				extract_variables
			end
		end
	end

	def destroy
		if @movie.destroy 
			flash[:success] = "Movie deleted"
			redirect_to movies_path
		end
	end

	def show
		@review = @movie.reviews.find(:first, conditions: ["user_id = ?", current_user.id])
		@reviews = Review.find(:all, conditions: ["movie_id = ?", @movie.id])
	end

	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
			redirect_to @movie
		else
			redirect_to user_path current_user
		end
		
	end

	def edit
		
	end

	def update
		
	end

	def index
		@movies = Movie.all
		@reviews = Review.all
	end

	def find_movie
		@movie = Movie.find(params[:id])
	end

	def extract_variables
		@actors = @movie["Actors"].split(/, */)
		@genres = @movie["Genre"].split(/, */)
		@directors = @movie["Director"].split(/, */)
		@writers = @movie["Writer"].split(/, */)
	end
end
