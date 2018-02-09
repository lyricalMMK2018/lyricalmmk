class ItemsController < ApplicationController
	skip_before_action :authenticate_user!

	def index
		#'全ての商品のデータを取得'
		@items = Item.order(:updated_at).includes(:artist).page(params[:page]).reverse_order
		@q = Item.ransack(params[:q])
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
		#37.2ms
		# results = @q.result.includes(artist, :songs).to_a.uniq
		# @items = Kaminari.paginate_array(results).page(params[:page])
		#10ms
		@items = @q.result(distinct: true).includes(:artist).joins(:artist, :songs).page(params[:page])
		#10ms
		# @items = @q.result(distinct: true).select('items.*').page(params[:page])

		render :index
		#indexページにおいて、@itemsはItemを全件取得しますが、searchメソッドをindexから実行した場合
		#@itemsで参照する値を検索結果に置き換えて、indexページを更新させます
	end

	private
		def item_params
			params.require(:item).permit(:item_name, :label, :jacket_image_id, :genre_id, :artist_id, :price, :stock, :admin_id, :delete_flag)
		end
end
