class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to reviews_path
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(prams[:id])
    review.update(review_params)
    redirect_to edit_review_path(review.id)
  end

  def destroy
    @review = Review.find(prams[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:cutomer_id, :movie_id)
  end

end
