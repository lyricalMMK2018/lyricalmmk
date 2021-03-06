class Item < ApplicationRecord
	belongs_to :admin
	belongs_to :artist
	belongs_to :genre

	attachment :jacket_image

	has_many :disks, dependent: :destroy
	has_many :songs, through: :disks
	has_many :item_orders
	has_many :carts
end
