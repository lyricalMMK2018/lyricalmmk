class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         #削除機能をdelete_flagをtrueに変更するに上書き
         def soft_delete
         	update_attribute(:delete_flag, true)
         end

         # ensure user account is active
         def active_for_authentication?
         	super && !deleted_at
         end

		# provide a custom message for a deleted account
		def inactive_message
			!deleted_at ? super : :deleted_account
		end

        has_many :carts
        has_many :orders
end
