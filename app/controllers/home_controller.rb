class HomeController < ApplicationController

	def index
		@products = Product.last(4)
  end

	def catalog_grid
	end
	
	def text_page
	end
	
	def product_page
	end	

	def shooping_cart
	end		
end
