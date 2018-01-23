class ItemOrder < ApplicationRecord
	belongs_to :order
	belongs_to :item
	enum delivery_status: { purchased: 0, ready_for_delivery: 1, departured: 2, delivered: 3 }
end
