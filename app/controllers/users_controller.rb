class UsersController < ApplicationController

	def show
	end

	private
		def user_params
			params.require(:user).permit(:firstname, :lastname, :firstname_kana, :lastname_kana, :zip_code, :address, :phone, :gender, :age, :delete_flag)
		end
	end

end
