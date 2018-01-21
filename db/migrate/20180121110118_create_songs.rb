class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|

    	t.string :song_name
    	t.time :song_length
    	t.integer :track_number
    	t.integer :disc_id
    	t.integer :artist_id

      t.timestamps
    end
  end
end
