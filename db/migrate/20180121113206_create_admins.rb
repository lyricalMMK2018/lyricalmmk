class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|

    	t.string :email, null: false
    	t.string :passoword, null: false

      t.timestamps
    end
  end
end
