class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :movies, dependent: :destroy

has_many :reviews, dependent: :destroy

has_many :likes, dependent: :destroy

end
