class AddColumnToAddress < ActiveRecord::Migration[5.2]
  def change
  	add_column :addresses, :user_id, :integer
  	add_column :addresses, :country, :string
  	add_column :addresses, :post_code, :string
  	add_column :addresses, :address, :string
  	add_column :addresses, :district, :string
  end
end
