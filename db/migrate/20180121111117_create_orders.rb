class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

    	t.integer :user_id
    	t.string :phone
    	t.integer :zip_code
    	t.string :address
    	t.string :firstname
    	t.string :lastname
    	t.boolean :delete_flag

      t.timestamps
    end
  end
end
