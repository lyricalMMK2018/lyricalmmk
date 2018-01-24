class ItemOrder < ApplicationRecord
	belongs_to :order
	belongs_to :item
	enum delivery_status: { purchased: 0, ready: 1, departed: 2, delivered: 3 }
end
