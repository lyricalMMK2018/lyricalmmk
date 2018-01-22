class OrdersController < ApplicationController

	def index
		#'ユーザーに紐ついたorderを全て取得'
		@orders = current_user.orders
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
			item_order.save
		end
	end

end
