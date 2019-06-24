class Category < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, :presence => true
	has_many :sub_categories

	def self.form_select_categories(blog)
  	result = ""
  	Category.all.each do |super_category|
  		result += "<optgroup label='#{super_category.name}'>"
  		super_category.sub_categories.each do |category|
	  		result += "<optgroup label='&nbsp;&nbsp;#{category.name}'>"
	  		category.sub_category_types.each do |sub_category|
		  		result += "<option value='#{sub_category.id}' #{blog.sub_category_id == sub_category.id ? 'selected=selected' : ''}>#{sub_category.name}</option>"
		  	end
		  	result += "</optgroup>"
	  	end
  		result += "</optgroup>"
  	end
    result.html_safe
  end

  def self.form_select_categories_type(blog)
  	result = ""
  	Category.all.each do |category|
  		result += "<optgroup label='#{category.name}'>"
  		category.sub_categories.each do |sub_category|
	  		result += "<optgroup label='&nbsp;&nbsp;#{sub_category.name}'>"
	  		sub_category.sub_category_types.each do |sub_category_type|
		  		result += "<option value='#{sub_category_type.id}' #{blog.sub_category_type_id == sub_category_type.id ? 'selected=selected' : ''}>#{sub_category_type.name}</option>"
		  	end
		  	result += "</optgroup>"
	  	end
  		result += "</optgroup>"
  	end
    result.html_safe
  end

  def as_json(options = {})
    all_options = options.merge!(:except => [:created_at, :updated_at, :image])
    super(all_options).tap do |json|
    end
  end

  def images
    {
      thumb: image.url("thumb".to_sym),
      medium: image.url("medium".to_sym),
      large: image.url("large".to_sym)
    }
  end
end


