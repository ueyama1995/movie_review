class LikesController < ApplicationController

def create
  # binding.pry
  review = Review.find_by(params[:review_id])
  like = current_user.likes.new(review_id: review.id)
  like.save
end

  def destroy
    review = Review.find_by(params[:review_id])
    like = current_user.likes.find_by(review_id: review.id)
    like.destroy
  end

end
