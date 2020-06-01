# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_01_132814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "reservation_status", default: "pending"
    t.string "url_room", default: "www.zoom.com"
    t.integer "chatroom"
    t.bigint "user_id", null: false
    t.bigint "proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "start_time"
    t.index ["proposal_id"], name: "index_bookings_on_proposal_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "primary_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "secondary_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["secondary_category_id"], name: "index_proposals_on_secondary_category_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "secondary_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "primary_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["primary_category_id"], name: "index_secondary_categories_on_primary_category_id"
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "start_time"
    t.bigint "proposal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_slots_on_proposal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "proposals"
  add_foreign_key "bookings", "users"
  add_foreign_key "proposals", "secondary_categories"
  add_foreign_key "proposals", "users"
  add_foreign_key "secondary_categories", "primary_categories"
end
