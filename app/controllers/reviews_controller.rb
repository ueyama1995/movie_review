class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @reviews = Review.all.order(created_at: :desc)
    @reviews = Review.page(params[:page]).reverse_order
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.save!
    redirect_to reviews_path
  end

  def show
   @review = Review.find(params[:id])
  end

  def edit
   @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :value, :comment,:review_id,:category,:title)
  end

end
