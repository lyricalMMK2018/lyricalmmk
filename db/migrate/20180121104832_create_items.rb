class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|

    	t.string :item_name, null: false, index: true
    	t.string :jacket_image_id, null: false
      t.string :label, null: false
    	t.integer :genre_id, null: false, index: true
    	t.integer :artist_id, null: false, index: true
    	t.integer :price, null: false
    	t.integer :stock, null: false
    	t.integer :admin_id, null: false, index: true
    	t.boolean :delete_flag

      t.timestamps
    end
  end
end
