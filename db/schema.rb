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

ActiveRecord::Schema.define(version: 20150802043309) do

  create_table "areas", force: true do |t|
    t.string   "area"
    t.string   "description"
    t.integer  "order"
    t.boolean  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.integer  "customer_company_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "areas", ["area_id"], name: "index_areas_on_area_id", using: :btree
  add_index "areas", ["customer_company_id"], name: "index_areas_on_customer_company_id", using: :btree

  create_table "customer_companies", force: true do |t|
    t.string   "company_customer"
    t.string   "rfc"
    t.string   "registered_name"
    t.boolean  "consortium"
    t.boolean  "active"
    t.integer  "created_user_id"
    t.string   "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_company_id"
  end

  add_index "customer_companies", ["customer_company_id"], name: "index_customer_companies_on_customer_company_id", using: :btree

  create_table "menu_options", force: true do |t|
    t.string   "module"
    t.string   "description"
    t.integer  "order"
    t.string   "path"
    t.string   "image"
    t.boolean  "consortium"
    t.boolean  "active"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_option_id"
  end

  add_index "menu_options", ["menu_option_id"], name: "index_menu_options_on_menu_option_id", using: :btree

  create_table "permits", force: true do |t|
    t.integer  "role_id"
    t.integer  "menu_option_id"
    t.boolean  "add"
    t.boolean  "update"
    t.boolean  "delete"
    t.boolean  "execute"
    t.boolean  "generate"
    t.boolean  "upload"
    t.boolean  "authorize"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permits", ["menu_option_id"], name: "index_permits_on_menu_option_id", using: :btree
  add_index "permits", ["role_id"], name: "index_permits_on_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "role"
    t.string   "description"
    t.boolean  "active"
    t.integer  "customer_company_id"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["customer_company_id"], name: "index_roles_on_customer_company_id", using: :btree

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.string   "rfc"
    t.string   "curp"
    t.boolean  "consortium"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "customer_company_id"
    t.integer  "workplace_id"
  end

  add_index "users", ["customer_company_id"], name: "index_users_on_customer_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["workplace_id"], name: "index_users_on_workplace_id", using: :btree

  create_table "workplaces", force: true do |t|
    t.string   "position"
    t.string   "description"
    t.integer  "user_level"
    t.boolean  "active"
    t.integer  "area_id"
    t.integer  "created_user_id"
    t.string   "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workplaces", ["area_id"], name: "index_workplaces_on_area_id", using: :btree

end
