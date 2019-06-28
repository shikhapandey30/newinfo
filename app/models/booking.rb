class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :product
  has_many :payments
end
