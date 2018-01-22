class ItemsController < ApplicationController
	def index
		#'全ての商品のデータを取得'
		@items = Item.all
		@items_page= Item.page(params[:page]).reverse_order
	end

	def show
		#'URLで指定されたITEM IDを持つデータを取得'
		@item = Item.find(params[:id])
		#'上の子であるディスクのデータを全て取得'
		@disks = @item.disks
	end

end
