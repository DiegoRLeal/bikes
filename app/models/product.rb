class Product < ApplicationRecord
  has_many :carts
  has_many :users, through: :user_carts
  belongs_to :user
  has_many_attached :photos
  validates :bike, :localization, :price, :bike_condition, presence: true
end
