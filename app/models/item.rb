class Item < ApplicationRecord
	belongs_to :admin
	belongs_to :artist
	belongs_to :genre
	has_many :disks
	has_many :item_prders
	has_many :carts
end
