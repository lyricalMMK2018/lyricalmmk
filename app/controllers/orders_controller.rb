class OrdersController < ApplicationController

	def names
		list = ''
		current_user.carts.find_each do |cart|
			if cart.quantity > cart.item.stock
				item_name = cart.item.item_name
				list += item_name + ', '
			end
		end
		return list
	end

	def index
	end

	def create
		order = Order.new(order_params)
		order.user_id = current_user.id
		carts = current_user.carts
		#カートの中身があるかどうかチェック
		if carts.blank?
			redirect_to carts_path, alert: 'No items in your cart'
		#在庫数チェック
		elsif carts.any? {|cart| cart.quantity > cart.item.stock}
			redirect_to carts_path, alert: "Sorry, we have insufficient stocks of #{names}please reduce the quantity and try again"
		#Orderフォームバリデーション通過
		elsif order.save
			carts.each do |cart|
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
		#Orderフォームバリデーションエラーが出ている場合
		else
			redirect_to carts_path, alert: 'Please fill out all of shipping destinations'
		end
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :phone, :zip_code, :address, :firstname, :lastname, :delete_flag)
		end

end
