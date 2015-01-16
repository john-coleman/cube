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

ActiveRecord::Schema.define(version: 20150115174748) do

  create_table "ad_computer_accounts", force: :cascade do |t|
    t.string   "domain",          limit: 255
    t.string   "machine_account", limit: 255
    t.string   "ou",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id",       limit: 4
  end

  create_table "device_ipv4_addresses", force: :cascade do |t|
    t.integer  "device_id",       limit: 4
    t.integer  "ipv4_address_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "device_ipv4_addresses", ["device_id", "ipv4_address_id"], name: "index_device_ipv4_addresses_on_device_id_and_ipv4_address_id", unique: true, using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "hostname",   limit: 255
    t.string   "domain",     limit: 255
    t.string   "os",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id", limit: 4
    t.integer  "owner_id",   limit: 4
    t.string   "pci_scope",  limit: 255
  end

  create_table "ipv4_addresses", force: :cascade do |t|
    t.string   "ipv4_address", limit: 255
    t.string   "mac_address",  limit: 255
    t.string   "ptr_record",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
