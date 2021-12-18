class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie , optional: true
  has_many :likes, dependent: :destroy

  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
