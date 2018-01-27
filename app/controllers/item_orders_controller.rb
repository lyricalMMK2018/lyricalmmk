class ItemOrdersController < ApplicationController

	private
		def item_order_params
			params.require(:item_order).permit(:item_id, :order_id, :quantity, :delivery_status, :saved_price)
		end

end
