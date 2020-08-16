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

ActiveRecord::Schema.define(version: 2020_08_16_132057) do

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_database_authentications", force: :cascade do |t|
    t.integer "user_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_user_database_authentications_on_email", unique: true
    t.index ["user_id"], name: "index_user_database_authentications_on_user_id", unique: true
  end

  create_table "user_registrations", force: :cascade do |t|
    t.string "confirmation_token", null: false
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_user_registrations_on_confirmation_token", unique: true
    t.index ["unconfirmed_email"], name: "index_user_registrations_on_unconfirmed_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

  add_foreign_key "user_database_authentications", "users"
end
