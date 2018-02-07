class CartsController < ApplicationController

	def index
		#'注文詳細を入力するための空のフォームを表示'
		@order = Order.new
	end

	def create
		#'送信された情報を元にカートの項目を一つ作成'
		cart = Cart.new(cart_params)
		#カートに入れようとしているアイテムがすでに存在しているか
		if current_user.carts.exists? {|current_cart| current_cart.item_id = cart.item_id}
			#ユーザーIDと商品IDが一致するレコードを取得
			current_cart = Cart.find_by(user_id: current_user.id, item_id: cart.item_id)
			#存在しているなら、quantityを追加する
			current_cart.quantity += cart.quantity
			#在庫数チェック
			if current_cart.quantity > current_cart.item.stock
				redirect_to item_path(current_cart.item), alert: 'Please pick items fewer than our stock'
			else
				#セーブ&リダイレクト
				current_cart.save
				redirect_to carts_path
			end
		else
			#'カートのDBが持ちたいユーザーIDを送信データに加える'
			cart.user_id = current_user.id
			#'数量が0以下なら'
			if cart.quantity <= 0
				#'itemのindexにリダイレクト'
				redirect_to item_path(cart.item), alert: 'The quantity must be greater than 0'
			#商品の個数が在庫より多い場合
			elsif cart.quantity > cart.item.stock
				reirect_to item_path(cart.item), alert: 'Please pick items fewer than our stock'
			else
				#'カート一件のデータを保存'
				cart.save
				#'カートのindexにリダイレクト'
				redirect_to carts_path
			end
		end
	end

	def update
		#'編集したいカートのデータを取得'
		@cart = Cart.find(params[:id])
		#'商品の個数が0より小さいなら'
		if @cart.quantity <= 0
			@cart.destroy
			redirect_to carts_path
		#在庫より注文数が多い場合
		elsif @cart.quantity > @cart.item.stock
			redirect_to carts_path, alert: 'Please pick items fewer than our stock'
		else
			#'送信された情報を元にカートのデータを更新'
			@cart.update(cart_params)
			redirect_to carts_path
		end
	end

	def destroy
		#'削除したいカートのデータを取得'
		@cart = Cart.find(params[:id])
		#'カートのデータ一件を削除'
		@cart.destroy
		#'ページを更新'
		redirect_to carts_path
	end

	private
		def cart_params
			params.require(:cart).permit(:user_id, :item_id, :quantity)
		end

end
