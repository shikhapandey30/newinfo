class CreateSubCategoryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_category_types do |t|
      t.string :name
      t.string :image
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
