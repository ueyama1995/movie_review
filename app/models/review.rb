class Review < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :comment, presence: true
  validates :value, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :genre, presence: true

  enum category: { 洋画: 0, 邦画: 1 }
  enum genre: { アクション: 0, アニメ: 1, SF: 2, ドラマ:3, ラブコメ:4, ホラー:5, ミュージカル: 6,コメディ:7, ドキュメンタリー:8 }


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
