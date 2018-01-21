class Item < ApplicationRecord
	belongs_to :admin
	belongs_to :artist
	belongs_to :genre
	has_many :disks
end
