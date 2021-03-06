class ReviewsController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @reviews = Review.page(params[:page]).reverse_order
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if review_params[:comment].blank?
      @review.score = 0
    else
      @review.score = Language.get_data(review_params[:comment])
    end
    @review.user = current_user
    if @review.save
      redirect_to reviews_path
      flash[:notice] = "投稿しました。"
    else
      render :new
    end
  end

  def show
   @review = Review.find(params[:id])
  end

  def edit
   @review = Review.find(params[:id])
   unless @review.user = current_user
      redirect_to  new_review_path
   end
  end

  def update
    @review = Review.find(params[:id])
    @review.score = Language.get_data(review_params[:comment])
    if @review.user != current_user
      redirect_to  new_review_path
    else
      if @review.update(review_params)
        redirect_to review_path(@review.id)
        flash[:notice] = "投稿情報を更新しました。"
      else
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  
  def correct_user
    @review = Review.find(params[:id])
    @user = @review.user
    redirect_to(reviews_path) unless @user == current_user
  end

  def review_params
    params.require(:review).permit(:user_id,:value, :comment,:review_id,:category,:title, :genre, :spoiler)
  end

end
