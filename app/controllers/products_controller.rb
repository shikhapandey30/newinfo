class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    if params[:sub_category_type_id].present?
      @products = Product.where(sub_category_type_id: params[:sub_category_type_id]).order("RANDOM()").uniq
      @tranding = Product.where(sub_category_type_id: params[:sub_category_type_id]).order("RANDOM()").limit(4).uniq
    else
     
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    if current_user.present?
      if current_user.rating_reviews.where(product_id: @product.id).any?
        @rating_review = current_user.rating_reviews.where(product_id: @product.id).first
      else
        @rating_review = RatingReview.new
      end
    else
      @rating_review = RatingReview.new
    end
   
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_wishlist
    @product = Product.find(params[:id])
    if user_signed_in?
      existing_wishlist = current_user.wishlists.where(product_id: @product.id)
      if existing_wishlist.present?
        flash.now[:error] = "Product is already in your Wishlist!"
      else
        current_user.wishlists.create(product_id: @product.id)
        flash.now[:success] = "Product has been added to your Wishlist!"
      end
    else
      flash[:error] = "You need to sign in or sign up before continuing."
    end
  end

  def wishlist
    product_ids = current_user.wishlists.map(&:product_id)
    products = Product.where(id: product_ids)
    category_ids = current_user.wishlists.map{|m| m.product}.map(&:category)
    category = Category.where(id: category_ids)
    if params[:sort] == "1"
      return @products = products.sort_by{ |m| m.price }
    elsif params[:sort] == "2"
     return @products = products.sort_by{ |m| m.price }.reverse
    elsif params[:sort] == "3"
      return @products = products.sort_by{ |m| m.id }.reverse
    elsif params[:sort] == "4"
      return @products = category.sort_by{ |m| m.id}.reverse
    else
     return @products = products
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :sub_category_type_id, :price, :full_price, :image, :status)
    end
end
