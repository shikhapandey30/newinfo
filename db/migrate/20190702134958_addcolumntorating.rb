class Addcolumntorating < ActiveRecord::Migration[5.2]
  def change
  	add_column :rating_reviews, :image, :string
  end
end
