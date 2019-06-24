class SubCategoryType < ApplicationRecord
	mount_uploader :image, ImageUploader

	# Association
	has_many :products
	belongs_to :sub_category

	# Validation
	validates :name, :sub_category_id, :presence => true

	# Delegates
	delegate :category, to: :sub_category, allow_nil: true


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
