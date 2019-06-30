ActiveAdmin.register SubCategoryType do

permit_params :name, :sub_category_id, :image

index do
    id_column
    column :name
    column "image" do |img|
      image_tag (img.image.url) ,width: 50, height: 50 rescue nil
    end
    column :sub_category
    actions
  end

form do |f|
    f.inputs do
      f.input :name
      f.input :image
      f.input :sub_category_id, as: :select, collection: option_groups_from_collection_for_select(Category.all, :sub_categories, :name, :id, :name, resource.sub_category_id)
    end
    f.actions 
  end
end
