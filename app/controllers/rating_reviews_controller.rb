class RatingReviewsController < ApplicationController
  # before_action :set_current_user, only: [:cart, :add_to_cart, :remove_from_cart]

 def create
 	 @product = Product.find(params[:product_id])
   if params[:rating_reviews][:rating_review_id].present?
   	 @rating_review = RatingReview.find(params[:rating_reviews][:rating_review_id])
   	 @rating_review.update(rating_review_params)
   else
	   @rating_review = RatingReview.new(rating_review_params)
	   @rating_review.user = current_user
	   @rating_review.product = @product
	   @rating_review.save
   end
   redirect_to "/products/#{@product.id}"
 end

 private

 def rating_review_params
 	 params.require(:rating_reviews).permit(:rating, :review)
 end
end




