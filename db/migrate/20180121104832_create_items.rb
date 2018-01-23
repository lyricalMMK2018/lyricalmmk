class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|

    	t.string :item_name
    	t.string :jacket_image_id
      t.string :label
    	t.integer :genre_id
    	t.integer :artist_id
    	t.integer :price
    	t.integer :stock
    	t.integer :admin_id
    	t.boolean :delete_flag

      t.timestamps
    end
  end
end
