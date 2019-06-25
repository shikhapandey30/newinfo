class HomeController < ApplicationController

	def index
		@products = Product.last(4)
		# @active_product = Product.all.where(status: "active")
  end

	def catalog_grid
		@products = Product.all
	end
	
	def text_page
	end
	
	def product_page
	end	

	def shooping_cart
	end		
end
