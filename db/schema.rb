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

ActiveRecord::Schema.define(version: 20150427221939) do

  create_table "batteries", force: :cascade do |t|
    t.integer "battery_type_id",      limit: 4
    t.integer "electronic_device_id", limit: 4
  end

  add_index "batteries", ["battery_type_id"], name: "index_batteries_on_battery_type_id", using: :btree
  add_index "batteries", ["electronic_device_id"], name: "index_batteries_on_electronic_device_id", using: :btree

  create_table "device_attribute_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "device_attributes", force: :cascade do |t|
    t.integer "device_id",                limit: 4
    t.integer "device_attribute_type_id", limit: 4
    t.string  "value",                    limit: 255
  end

  add_index "device_attributes", ["device_attribute_type_id"], name: "index_device_attributes_on_device_attribute_type_id", using: :btree
  add_index "device_attributes", ["device_id"], name: "index_device_attributes_on_device_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string "CreateDevice", limit: 255
  end

end
