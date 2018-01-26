class ItemsController < ApplicationController
	skip_before_action :authenticate_user!

	def index
		#'全ての商品のデータを取得'
		@items= Item.page(params[:page]).reverse_order
	end

	def show
		#'URLで指定されたITEM IDを持つデータを取得'
		@item = Item.find(params[:id])
		#'上の子であるディスクのデータを全て取得'
		@disks = @item.disks
		#Viewでは@disks each do |disk|、songs = disk.songs、songs each do |song|
	end

	def search
		#Itemsコントローラーの範囲内での検索機能は、ransackのAdvanced Modeを使ってください
		@q = Item.ransack(params[:q])
		@items = @q.result.includes(:genre, :artist, :disks, :songs).page(params[:page])
		render :index
		#indexページにおいて、@itemsはItemを全件取得しますが、searchメソッドをindexから実行した場合
		#@itemsで参照する値を検索結果に置き換えて、indexページを更新させます
	end

	private
		def item_params
			params.require(:item).permit(:item_name, :label, :jacket_image_id, :genre_id, :artist_id, :price, :stock, :admin_id, :delete_flag)
		end
	end
end
