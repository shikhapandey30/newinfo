class LikesController < ApplicationController
	before_action :set_product
	def create
	 Like.create_like(@product, current_user)
	end

	def dislike
	 Like.create_dislike(@product, current_user)
	end
	
	private
		def set_product
		 @product=User.find_product(params[:id], params[:type])
		end
end