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
         	super && !delete_flag
         end

		# provide a custom message for a deleted account
		def inactive_message
			!delete_flag ? super : :deleted_account
		end

        has_many :carts
        has_many :orders

        enum gender: { Male: 0, Female: 1, Secret: 2 }

        validates :email,length: { in: 4..256 }
        # validates :password, presence: true, length: { in: 6..128 }
        # パスワードにバリデーションはダメです
        validates :firstname, presence: true, length: { maximum: 128 }
        validates :lastname, presence: true, length: { maximum: 128 }
        validates :firstname_kana, presence: true, length: { maximum: 128 }
        #validates_format_of :firstname_kana, with: /^[ァ-ンー－]+$/
        validates :lastname_kana, presence: true, length: { maximum: 128 }
        #validates_format_of :lastname_kana, with: /^[ァ-ンー－]+$/
        validates :zip_code, numericality: true, length: { is: 7 }
        validates :address, length: { maximum: 128 }
        validates :phone, numericality: true, length: { in: 10..11 }
        validates :age, presence: true, numericality: { less_than: 128 }
end
