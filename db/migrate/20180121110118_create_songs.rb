class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|

    	t.string :song_name, null: false, index: true
    	t.time :song_length, null: false
    	t.integer :track_number, null: false
    	t.integer :disc_id, null: false, index: true
    	t.integer :artist_id, null: false, index: true

      t.timestamps
    end
  end
end
