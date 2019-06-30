ActiveAdmin.register Category do

	permit_params :id, :name, :image

  index do
    id_column
    column :name
    column "image" do |img|
      image_tag (img.image.url) ,width: 50, height: 50 rescue nil
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image
    end
    f.actions 
  end
end
