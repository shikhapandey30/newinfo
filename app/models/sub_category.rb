class SubCategory < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, :category_id, :presence => true
	belongs_to :category
	has_many :sub_category_types


	def as_json(options = {})
    all_options = options.merge!(:except => [:created_at, :updated_at, :image])
    super(all_options).tap do |json|
    end
  end

	def images
    { thumb: image.url("thumb".to_sym),
      medium: image.url("medium".to_sym),
      large: image.url("large".to_sym) }
  end
end
