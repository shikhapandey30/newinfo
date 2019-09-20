class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :user_id, :integer
  	add_column :orders, :product_id, :integer
  	add_column :orders, :cart_id, :integer
  	add_column :orders, :total, :integer
  	add_column :orders, :status, :string
  	add_column :orders, :contact_name, :text
  	add_column :orders, :delivery_address, :text
  	add_column :orders, :ccname, :text
  	add_column :orders, :ccnumber, :text
  	add_column :orders, :ccexpirydate, :text
  	add_column :orders, :quantity, :integer
  	add_column :orders, :stripe_token, :string
  	add_column :orders, :stripe_token_type, :string
  	add_column :orders, :address_id, :integer
  	add_column :orders, :cart_item_id, :integer
  end
end
