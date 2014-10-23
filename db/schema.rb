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

ActiveRecord::Schema.define(version: 20141023165423) do

  create_table "ad_computer_accounts", force: true do |t|
    t.string   "domain"
    t.string   "machine_account"
    t.string   "ou"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", force: true do |t|
    t.string   "hostname"
    t.string   "domain"
    t.string   "os"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_ipv4_addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "hostname"
    t.string   "domain"
    t.string   "os"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ipv4_addresses", force: true do |t|
    t.string   "ipv4_address"
    t.string   "mac_address"
    t.string   "ptr_record"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
