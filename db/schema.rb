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

ActiveRecord::Schema.define(version: 20141207214327) do

  create_table "attendances", force: true do |t|
    t.string   "event"
    t.string   "location"
    t.datetime "marked_at"
    t.integer  "employee_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id", using: :btree

  create_table "branch_offices", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "region"
    t.string   "address"
    t.integer  "customer_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_offices", ["customer_id"], name: "index_branch_offices_on_customer_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "clientType"
    t.integer  "status"
    t.string   "rut"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "meid"
    t.string   "esn"
    t.string   "imei"
    t.string   "wlanMacAddress"
    t.integer  "employee_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["employee_id"], name: "index_devices_on_employee_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "worker_id"
    t.string   "run"
    t.string   "names"
    t.string   "lastnames"
    t.string   "email"
    t.string   "addres"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id",         null: false
    t.integer  "weekly_hours"
    t.text     "contract_type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "employees", ["customer_id"], name: "index_employees_on_customer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "users", ["customer_id"], name: "index_users_on_customer_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workplaces", force: true do |t|
    t.integer  "branch_office_id", null: false
    t.integer  "employee_id",      null: false
    t.datetime "working_since"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workplaces", ["branch_office_id"], name: "index_workplaces_on_branch_office_id", using: :btree
  add_index "workplaces", ["employee_id"], name: "index_workplaces_on_employee_id", using: :btree

end
