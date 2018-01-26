class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

    	t.integer :user_id, null: false, index: true
    	t.string :phone, null: false, index: true
    	t.string :zip_code, null: false
    	t.string :address, null: false
    	t.string :firstname, null: false
    	t.string :lastname, null: false
    	t.boolean :delete_flag

      t.timestamps
    end
  end
end
