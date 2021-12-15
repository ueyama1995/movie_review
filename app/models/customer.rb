class Customer < ApplicationRecord

has_many :movies, dependent: :destroy
has_many :reviews, dependent: :destroy
has_many :likes, dependent: :destroy
end
