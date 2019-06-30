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

ActiveRecord::Schema.define(version: 2019_06_30_060425) do

  create_table "access_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.string "access_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_access_tokens_on_user_id", unique: true
  end

  create_table "transport_histories", force: :cascade do |t|
    t.integer "transport_id"
    t.string "status", null: false
    t.string "description"
    t.string "use_yn", limit: 1, default: "Y", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_id"], name: "index_transport_histories_on_transport_id"
  end

  create_table "transports", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "driver_id"
    t.string "destination", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_transports_on_driver_id"
    t.index ["passenger_id"], name: "index_transports_on_passenger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password", null: false
    t.string "phone_number"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
