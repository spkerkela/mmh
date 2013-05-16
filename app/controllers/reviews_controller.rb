class ReviewsController < ApplicationController

	before_filter :find_review, except: [:new, :create, :index]
	#before_filter :find_movie, only: [:new]

	def index
		@movie = Movie.find(params[:movie_id])
		@reviews = Review.find(:all, conditions: ["movie_id = ?", params[:movie_id]])
		
	end

	def new
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.new(user_id: current_user.id)
	end

	def edit
		
	end

	def show
		
	end

	def create
		@review = Review.new(params[:review])
		if @review.save
			flash.now[:success] = "Review created"
			redirect_to movies_path
		else
			flash.now[:alert] = "Creating review failed"
			render 'new'
		end
	end

	def destroy
		
	end

	def update
		
	end

	private

		def find_movie
			@movie = Movie.find(params[:movie_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end
end