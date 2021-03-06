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
			flash[:success] = "Review created"

			movie_name = Movie.find(@review.movie_id).title
			current_user.microposts.create(content: "#{current_user.name} reviewed #{movie_name} and gave it a rating of #{@review.rating}.")
			redirect_to movie_path @review.movie_id
		else
			flash.now[:alert] = "Creating review failed"
			render 'new'
		end
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@review = Review.find(params[:id])

		if @review.destroy
			flash[:success] = "Review deleted"
			redirect_to @movie
		else
			flash[:alert] = "Deletion of review failed"
			redirect_to @movie
		end
	end

	def update
		#movie = Movie.find(params[:movie_id])
		if @review.update_attributes(params[:review])
			flash[:success] = "Review updated"
			redirect_to movie_path @review.movie_id
		else
    		flash.now[:alert] = "There are some issues with your form"
			render :edit
		end
	end

	private

		def find_movie
			@movie = Movie.find(params[:movie_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end
end