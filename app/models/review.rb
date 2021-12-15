class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  has_many :likes, dependent: :destroy

  def favorited_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
end
