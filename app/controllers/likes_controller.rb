class LikesController < ApplicationController

def create
  @review = Review.find_by(id: params[:review_id])
  like = current_user.likes.new(review_id: @review.id)
   #binding.pry
  like.save
end

  def destroy
    @review = Review.find_by(id: params[:review_id])
    like = current_user.likes.find_by(review_id: @review.id)
    like.destroy
  end

end
