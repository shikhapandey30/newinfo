class HomeController < ApplicationController

	def index
		@products = Product.last(4)
		@featured_product = Product.all.where(status: "active").limit(4)
  end

	def catalog_grid
		@products = Product.all.paginate(:page => params[:page], :per_page => 6)
	end
	
	def text_page
	end
	
	def product_page
	end	

	def shooping_cart
	end		
end
