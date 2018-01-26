class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|

    	t.integer :user_id, null: false, index: true
    	t.integer :item_id, null: false, index: true
    	t.integer :quantity, null: false

      t.timestamps
    end
  end
end
