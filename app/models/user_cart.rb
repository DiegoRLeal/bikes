class UserCart < ApplicationRecord
  STATUS = ['pending', 'approved', 'denied']
  belongs_to :user
  belongs_to :product
  has_many :products
  validates :status, inclusion: { in: STATUS }
end
