class Offer < ApplicationRecord
  validates :bike, :localization, :price, :bike_condition, presence: true
  validates :price, numericality: { only_integer: true }
  has_one_attached :image
end
