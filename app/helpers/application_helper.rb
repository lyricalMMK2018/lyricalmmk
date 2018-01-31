module ApplicationHelper

	def sub_total_per_order(x)
		sub_total = 0
		x.item_orders.each do |item_order|
			y = item_order.saved_price * item_order.quantity
			sub_total += y
		end
		return sub_total
	end

	def sub_total_each_carts
		sub_total = 0
		current_user.carts.each do |cart|
			y = cart.item.price * cart.quantity
			sub_total += y
		end
		return sub_total
	end

end
