class ItemOrder < ApplicationRecord
	belongs_to :order
	belongs_to :item
	enum delivery_status: { purchased: 0, ready: 1, departed: 2, delivered: 3 }

	validates :item_id, presence: true
	validates :order_id, presence: true
	validates :quantity, presence: true, numericality: { greater_than: 0 }
	validates :delivery_status, presence: true, numericality: true
	validates :saved_price, presence: true, numericality: true
end
