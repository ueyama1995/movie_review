class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    # review.movie = find_by(params[:movie_id]) ## あとで変える,　パラメーターでmovie_idをもってこれるようにする
    review.user = current_user
    
    #binding.pry
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
    review.update(review_params)
    redirect_to reviews_path(review.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :title, :review, :comment)
  end

end
