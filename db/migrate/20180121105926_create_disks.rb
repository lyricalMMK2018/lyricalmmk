class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|

    	t.integer :item_id, null: false, index: true
    	t.string :disk_name, null: false, index: true
    	t.integer :disk_number, null: false

      t.timestamps
    end
  end
end
