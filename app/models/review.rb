class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie , optional: true
  #has_many :movies, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search, word)
    if search == "forward_match"
      @review = Review.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("title LIKE?","%#{word}")
    elsif search == "perfect_match"
     @review = Review.where(title: "#{word}")
    elsif search == "partial_match"
      @review = Review.where("title LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

  #validates :review,presence:true

end
