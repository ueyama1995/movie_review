class Review < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :comment, presence: true
  validates :value, presence: true
  validates :title, presence: true
  validates :category, presence: true

  enum category: { 洋画: 0, 邦画: 1 }


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
