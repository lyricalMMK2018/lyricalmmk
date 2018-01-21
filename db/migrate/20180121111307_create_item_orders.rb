class CreateItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|

    	t.integer :item_id
    	t.integer :order_id
    	t.integer :quantity
    	t.integer :delivery_status
    	t.integer :saved_price

      t.timestamps
    end
  end
end
