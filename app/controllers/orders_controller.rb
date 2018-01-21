class OrdersController < ApplicationController

	def index
		#'ユーザーに紐ついたorderを全て取得'
		@orders = current_user.orders
		#これより下はviewに記述
		#'それぞれの購入機会で買ったアイテムたちを表示'
		@orders each do |order|
			sum = 0
			item_orders = order.item_orders
			item_orders each do |item_order|
				y = item_order.price * item_order.qty
				sum += y if y
			end
		end
	end

	def create
		order = order.new(item_order_params)
		order.user_id = current_user.id
		order.save
		@carts each do |cart|
			item_order = item_order.new(params[:id])
			item_order.item_id = cart.item_id
			item_order.price = item_order.item.price
			item_order.qty = cart.qty
			item_order.order_id = order.id
			item_order.status = 0
			# enum status: { 注文済み: 0, 発送準備中: 1, 発送済み: 2, 到着済み: 3 }
			item_order.save
		end
	end

end
