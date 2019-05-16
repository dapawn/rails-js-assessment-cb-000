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

ActiveRecord::Schema.define(version: 2019_05_15_140645) do

  create_table "applicants", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "address"
    t.integer "gender"
    t.integer "dob"
    t.string "phone"
    t.integer "married_status"
    t.integer "church_id"
    t.string "occupation"
    t.integer "occupation_status"
    t.string "income"
    t.integer "home_ownership"
    t.string "home_material"
    t.boolean "electricity"
    t.boolean "running_water"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string "description"
    t.string "value"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "churches", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "minister"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "household_members", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "relation"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "item"
    t.string "cost"
    t.integer "availability"
    t.string "business"
    t.string "benefit"
    t.string "why"
    t.string "recommendation"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
