class RatingReview < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :product

	def display_rating
		if self.new_record?
			0
		else
			(self.rating/2.0).round(1)
		end
	end

	def half_star?
		if ((self.rating/2.0).to_s.split('.')[1].to_i) > 0
			true
		else
			false
		end
	end

	def get_user_info
		self.user.name.present? ? user.name : user.email
	end
end