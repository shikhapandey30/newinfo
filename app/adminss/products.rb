ActiveAdmin.register Product do

permit_params :id, :name, :description, :sub_category_type_id, :price, :full_price, :image, :status

index do
  id_column
  column :name	  
  column :category
  column :sub_category_type
  column :sub_category
  column :price
  column :full_price
  column "image" do |img|
    image_tag (img.image.url) ,width: 50, height: 50 rescue nil
  end
  column :status
  actions
end

form do |f|
  f.inputs do
    f.input :name
    # f.input :description, as: :ckeditor
    f.input :description, as: :ckeditor
    f.input :sub_category_type_id, as: :select, collection: (Category.form_select_categories_type(f.object))   
    f.input :price
    f.input :full_price
    f.input :image
    f.input :status, as: :select, collection: Product::STATUS.invert, include_blank: false
  end
  f.actions
end

show do
    attributes_table do
      row :name    
      row :category
      row :sub_category_type
      row :sub_category
      row :description do |p|
        raw p.description
      end
      
      row :created_at
      row :updated_at
    end
    
  end
end
