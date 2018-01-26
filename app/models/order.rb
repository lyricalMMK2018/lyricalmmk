class Order < ApplicationRecord
	belongs_to :user
	has_many :item_orders

	validates :user_id, presence: true, numericality: true
	validates :phone, presence: true, numericality: true, length: { in: 10..11 }
	validates :zip_code, presence: true, numericality: true, length: { is: 7 }
	validates :address, presence: true, length: { maximum: 50 }
	validates :firstname, presence: true, length: { maximum: 128 }
	validates :lastname, presence: true, length: { maximum: 128 }
end
