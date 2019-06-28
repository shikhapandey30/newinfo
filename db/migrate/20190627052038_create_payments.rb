class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :txn_id
      t.float :txn_amount
      t.string :payment_mode
      t.datetime :txn_date
      t.string :status
      t.string :getway
      t.string :bank_txn_id
      t.string :bank_name
      t.integer :product_id

      t.timestamps
    end
  end
end
