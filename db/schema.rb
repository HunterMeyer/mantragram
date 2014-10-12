# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141012203835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mantras", force: true do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "description"
    t.text     "schedule"
    t.text     "status"
    t.boolean  "last_delivery_bounced"
    t.datetime "last_delivery_bounced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "styles", force: true do |t|
    t.integer "user_id"
    t.text    "background",          default: "#E8E8E8"
    t.text    "heading",             default: "#333"
    t.text    "card_background",     default: "#FFF"
    t.text    "card_title",          default: "#525252"
    t.text    "card_title_hover",    default: "#424242"
    t.text    "send_mantra",         default: "#428bca"
    t.text    "send_mantra_hover",   default: "#2A6496"
    t.text    "delete_mantra",       default: "#F04444"
    t.text    "delete_mantra_hover", default: "#CC2828"
    t.text    "create_button",       default: "primary"
    t.text    "bip",                 default: "#525252"
    t.text    "bip_hover",           default: "#424242"
    t.text    "navbar",              default: "#FFF"
  end

  create_table "users", force: true do |t|
    t.text     "mobile_number"
    t.text     "smtp_address"
    t.text     "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "reference"
    t.text     "status"
    t.boolean  "last_delivery_bounced"
    t.datetime "last_delivery_bounced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text     "carrier"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["mobile_number"], name: "index_users_on_mobile_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
