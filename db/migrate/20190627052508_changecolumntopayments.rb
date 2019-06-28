class Changecolumntopayments < ActiveRecord::Migration[5.2]
  def change
  	add_column :payments, :booking_id, :integer
  	remove_column :payments, :product_id, :integer
  end
end
