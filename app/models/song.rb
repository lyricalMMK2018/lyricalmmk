class Song < ApplicationRecord
	belongs_to :disk
	belongs_to :artist
end
