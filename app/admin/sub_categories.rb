ActiveAdmin.register SubCategory do

  permit_params :id, :name, :category_id, :image

  index do
    id_column
    column :name
    column "image" do |img|
      image_tag (img.image.url) ,width: 50, height: 50 rescue nil
    end
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image
      f.input :category_id, as: :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}  
    end
    f.actions 
  end

  show do
    attributes_table :name, :category, :image
  end
end