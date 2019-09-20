class AddIsDoneToCart < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :is_done, :boolean, :default => false
  end
end
