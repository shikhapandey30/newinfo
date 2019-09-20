class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	has_many :orders

	def sub_total
		# cart_items.map(&:price).sum
		cart_items.map(&:price).reject {|e| !e.present?}.sum
	end

	def quantity
		cart_items.map(&:quantity).sum
	end
end
