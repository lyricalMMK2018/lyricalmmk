class Order < ApplicationRecord
	belongs_to :user
	has_many :item_orders
	enum status: { 注文済み: 0, 発送準備中: 1, 発送済み: 2, 到着済み: 3 }
end
