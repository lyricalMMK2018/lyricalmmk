class CartsController < ApplicationController

	def index
		#'ユーザーIDに所属するカートのデータを全て取得'
		@carts = current_user.carts
		#'注文詳細を入力するための空のフォームを表示'
		@order = Order.new
	end

	def create
		#'送信された情報を元にカートの項目を一つ作成'
		@cart = Cart.new(cart_params)
		#'カートのDBが持ちたいユーザーIDを送信データに加える'
		@cart.user_id = current_user.id
		#'数量が0以上なら'
		if @cart.quantity > 0
			#'カート一件のデータを保存'
			@cart.save
			#'カートのindexにリダイレクト'
			redirect_to carts_path
		else
			#'itemのindexにリダイレクト'
			redirect_to items_path
		end
	end

	def update
		#'編集したいカートのデータを取得'
		@cart = Cart.find(params[:id])
		#'商品の個数が0より大きいなら'
		if @cart.quantity > 0
			#'送信された情報を元にカートのデータを更新'
			@cart.update(cart_params)
		#'0なら'
		else
			@cart.destroy
		end
		#'ページを更新'
		render :index
	end

	def destroy
		#'削除したいカートのデータを取得'
		@cart = Cart.find(params[:id])
		#'カートのデータ一件を削除'
		@cart.destroy
		#'ページを更新'
		render :index
	end

	private
		def cart_params
			params.require(:cart).permit(:user_id, :item_id, :quantity)
		end
	end

end
