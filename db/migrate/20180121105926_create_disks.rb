class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|

    	t.integer :item_id
    	t.string :disk_name

      t.timestamps
    end
  end
end
