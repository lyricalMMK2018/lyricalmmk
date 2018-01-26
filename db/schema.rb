# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180126152543) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_name"], name: "index_artists_on_artist_name"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_carts_on_item_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "disks", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "disk_name", null: false
    t.integer "disk_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disk_name"], name: "index_disks_on_disk_name"
    t.index ["item_id"], name: "index_disks_on_item_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_orders", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity", null: false
    t.integer "delivery_status", null: false
    t.integer "saved_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_orders_on_item_id"
    t.index ["order_id"], name: "index_item_orders_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "jacket_image_id", null: false
    t.string "label", null: false
    t.integer "genre_id", null: false
    t.integer "artist_id", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.integer "admin_id", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_items_on_admin_id"
    t.index ["artist_id"], name: "index_items_on_artist_id"
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["item_name"], name: "index_items_on_item_name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "phone", null: false
    t.string "zip_code", null: false
    t.string "address", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_orders_on_phone"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_name", null: false
    t.time "song_length", null: false
    t.integer "track_number", null: false
    t.integer "disc_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["disc_id"], name: "index_songs_on_disc_id"
    t.index ["song_name"], name: "index_songs_on_song_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.string "zip_code", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firstname"], name: "index_users_on_firstname"
    t.index ["firstname_kana"], name: "index_users_on_firstname_kana"
    t.index ["lastname"], name: "index_users_on_lastname"
    t.index ["lastname_kana"], name: "index_users_on_lastname_kana"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
