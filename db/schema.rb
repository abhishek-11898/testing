# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_13_142157) do

  create_table "admin_freind", id: false, force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "freind_id", null: false
    t.index ["admin_id", "freind_id"], name: "index_admin_freind_on_admin_id_and_freind_id"
    t.index ["freind_id", "admin_id"], name: "index_admin_freind_on_freind_id_and_admin_id"
  end

  create_table "freindships", force: :cascade do |t|
    t.string "status"
    t.integer "user_id", null: false
    t.integer "freind_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_freindships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.string "email"
    t.text "bio"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_users_on_admin_id"
  end

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "freind_id", null: false
    t.index ["admin_id", "freind_id"], name: "index_users_users_on_admin_id_and_freind_id"
    t.index ["freind_id", "admin_id"], name: "index_users_users_on_freind_id_and_admin_id"
  end

  add_foreign_key "freindships", "users"
  add_foreign_key "users", "users", column: "admin_id"
end
