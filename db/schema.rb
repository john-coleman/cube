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

ActiveRecord::Schema.define(version: 20141024170041) do

  create_table "ad_computer_accounts", force: true do |t|
    t.string   "domain"
    t.string   "machine_account"
    t.string   "ou"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_ipv4_addresses", force: true do |t|
    t.integer  "device_id"
    t.integer  "ipv4_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "device_ipv4_addresses", ["device_id", "ipv4_address_id"], name: "index_device_ipv4_addresses_on_device_id_and_ipv4_address_id", unique: true, using: :btree

  create_table "devices", force: true do |t|
    t.string   "hostname"
    t.string   "domain"
    t.string   "os"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "creator"
    t.string   "owner"
    t.string   "pci_scope"
  end

  create_table "devices_ipv4_addresses", force: true do |t|
    t.string   "devices"
    t.string   "ipv4_addresses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices_ipv4_addresses", ["ipv4_addresses"], name: "index_devices_ipv4_addresses_on_ipv4_addresses", using: :btree

  create_table "ipv4_addresses", force: true do |t|
    t.string   "ipv4_address"
    t.string   "mac_address"
    t.string   "ptr_record"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "display_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
