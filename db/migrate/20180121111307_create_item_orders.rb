class CreateItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|

    	t.integer :item_id, null: false, index: true
    	t.integer :order_id, null: false, index: true
    	t.integer :quantity, null: false
    	t.integer :delivery_status, null: false
    	t.integer :saved_price, null: false

      t.timestamps
    end
  end
end
