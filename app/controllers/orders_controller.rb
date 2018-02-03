class OrdersController < ApplicationController

	def index
	end

	def create
		if current_user.carts.any?
			#注文数と在庫数を比べる
			current_user.carts.each do |cart|
				if cart.quantity > cart.item.stock
					redirect_to carts_path, alert: "Sorry, we have insufficient stocks of #{cart.item.item_name}, please reduce the quantity and try again"
				end
			end
			order = Order.new(order_params)
			order.user_id = current_user.id
			if order.save
				#ユーザーが持っているカートの情報を全て取得
				#カートに登録されいているアイテムひとつずつに対して
				current_user.carts.each do |cart|
					#新規項目を作成
					item_order = ItemOrder.new
					#cartが持っている項目をitem_orderが持つ形に変換
					item_order.item_id = cart.item_id
					item_order.saved_price = cart.item.price
					item_order.quantity = cart.quantity
					#足りない情報を補充
					item_order.order_id = order.id
					item_order.delivery_status = 0
					item_order.save
					#在庫から購入数を引く
					cart.item.stock -= cart.quantity
					cart.item.save
					cart.destroy
				end
				#-- !Thank you --
				redirect_to orders_path, notice: 'Thank you for trading with us!'
			else
				redirect_to carts_path, alert: 'Please fill all of the shipment destinations'
			end
		else
			redirect_to carts_path
		end
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :phone, :zip_code, :address, :firstname, :lastname, :delete_flag)
		end

end
