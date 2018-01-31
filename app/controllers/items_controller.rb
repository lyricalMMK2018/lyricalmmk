class ItemsController < ApplicationController
	skip_before_action :authenticate_user!

	def index
		#'全ての商品のデータを取得'
<<<<<<< HEAD
		@items= Item.where(delete_flag: false).page(params[:page]).reverse_order
=======
		@items= Item.order(:updated_at).page(params[:page]).reverse_order
>>>>>>> 8e5f91570601b671914be898bf60139d6b6bc0c6
	end

	def show
		#'URLで指定されたITEM IDを持つデータを取得'
		@item = Item.find(params[:id])
		#'上の子であるディスクのデータを全て取得'
		@disks = @item.disks
		#Viewでは@disks each do |disk|、songs = disk.songs、songs each do |song|
		@cart = Cart.new
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
