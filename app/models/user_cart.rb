class UserCart < ApplicationRecord
  STATUS = ['pending', 'approved', 'denied']
  belongs_to :user
  belongs_to :product
end
