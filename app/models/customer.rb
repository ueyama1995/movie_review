class Customer < ApplicationRecord
has_many :movies, dependent: :destroy

has_many :reviews, dependent: :destroy

has_many :likes, dependent: :destroy

has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :followings, through: :relationships, source: :followed
has_many :followers, through: :reverse_of_relationships, source: :follower
    def follow(customer_id)
      relationships.create(followed_id: customer_id)
    end
    # フォロー解除時の処理
    def unfollow(customer_id)
      relationships.find_by(followed_id: customer_id).destroy
    end
    # フォロー判定の有無
    def following?(customer)
      followings.include?(customer)
    end
end
