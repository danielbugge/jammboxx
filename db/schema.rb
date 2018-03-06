c# This file is auto-generated from the current state of the database. Instead
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

ActiveRecord::Schema.define(version: 20180306182441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrument_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "model"
    t.bigint "user_id"
    t.bigint "instrument_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_type_id"], name: "index_instruments_on_instrument_type_id"
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "jamm_players", force: :cascade do |t|
    t.bigint "jamm_id"
    t.bigint "user_id"
    t.bigint "instrument_id"
    t.boolean "leader"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_jamm_players_on_instrument_id"
    t.index ["jamm_id"], name: "index_jamm_players_on_jamm_id"
    t.index ["user_id"], name: "index_jamm_players_on_user_id"
  end

  create_table "jamms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "address"
    t.date "date"
    t.integer "duration"
    t.bigint "genre_id"
    t.integer "max_players"
    t.string "level"
    t.boolean "allow_new_instrument"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["genre_id"], name: "index_jamms_on_genre_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "instruments", "instrument_types"
  add_foreign_key "instruments", "users"
  add_foreign_key "jamm_players", "instruments"
  add_foreign_key "jamm_players", "jamms"
  add_foreign_key "jamm_players", "users"
  add_foreign_key "jamms", "genres"
end
