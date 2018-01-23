class ItemsController < ApplicationController
	skip_before_action :authenticate_user!

	def index
		#'全ての商品のデータを取得'
		@items_page= Item.page(params[:page]).reverse_order
	end

	def show
		#'URLで指定されたITEM IDを持つデータを取得'
		@item = Item.find(params[:id])
		#'上の子であるディスクのデータを全て取得'
		@disks = @item.disks
	end

	private
		def item_params
			params.require(:item).permit(:item_name, :label, :jacket_image_id, :genre_id, :artist_id, :price, :stock, :admin_id, :delete_flag)
		end
	end
end
