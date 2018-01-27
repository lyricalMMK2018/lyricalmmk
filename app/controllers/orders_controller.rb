class OrdersController < ApplicationController

	def index
		#'ユーザーに紐ついたorderを全て取得'
		@orders = current_user.orders
	end

	def create
		order = order.new(order_params)
		order.user_id = current_user.id
		order.save
		#ユーザーが持っているカートの情報を全て取得
		carts = current_user.carts
		#カートに登録されいているアイテムひとつずつに対して
		carts each do |cart|
			#新規項目を作成
			item_order = item_order.new
			#cartが持っている項目をitem_orderが持つ形に変換
			item_order.item_id = cart.item_id
			item_order.saved_price = cart.item.price
			item_order.quantity = cart.quantity
			#足りない情報を補充
			item_order.order_id = order.id
			item_order.deliverty_status = 0
			item_order.save
			cart.destroy
		end
		#-- !Thank you --
		redirect_to orders_path, alert: 'Thank you for trading with us!'
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :phone, :zip_code, :address, :firstname, :lastname, :delete_flag)
		end


end
