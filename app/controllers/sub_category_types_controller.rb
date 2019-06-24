class SubCategoryTypesController < ApplicationController
  before_action :set_sub_category_type, only: [:show, :edit, :update, :destroy]

  # GET /sub_category_types
  # GET /sub_category_types.json
  def index
    @sub_category_types = SubCategoryType.all
  end

  # GET /sub_category_types/1
  # GET /sub_category_types/1.json
  def show
  end

  # GET /sub_category_types/new
  def new
    @sub_category_type = SubCategoryType.new
  end

  # GET /sub_category_types/1/edit
  def edit
  end

  # POST /sub_category_types
  # POST /sub_category_types.json
  def create
    @sub_category_type = SubCategoryType.new(sub_category_type_params)

    respond_to do |format|
      if @sub_category_type.save
        format.html { redirect_to @sub_category_type, notice: 'Sub category type was successfully created.' }
        format.json { render :show, status: :created, location: @sub_category_type }
      else
        format.html { render :new }
        format.json { render json: @sub_category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_category_types/1
  # PATCH/PUT /sub_category_types/1.json
  def update
    respond_to do |format|
      if @sub_category_type.update(sub_category_type_params)
        format.html { redirect_to @sub_category_type, notice: 'Sub category type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_category_type }
      else
        format.html { render :edit }
        format.json { render json: @sub_category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_category_types/1
  # DELETE /sub_category_types/1.json
  def destroy
    @sub_category_type.destroy
    respond_to do |format|
      format.html { redirect_to sub_category_types_url, notice: 'Sub category type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category_type
      @sub_category_type = SubCategoryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_type_params
      params.require(:sub_category_type).permit(:name, :image, :sub_category_id)
    end
end
