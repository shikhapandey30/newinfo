class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.float :unit_price
      t.integer :quantity, :default => 1
      t.float :price

      t.timestamps
    end
  end
end
