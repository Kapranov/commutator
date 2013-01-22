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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121211121903) do

  create_table "cities", :force => true do |t|
    t.string   "city",       :limit => 34, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "manufacturer", :limit => 64, :null => false
    t.string   "model",        :limit => 32, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "statports", :force => true do |t|
    t.string   "ip",         :limit => 32,                  :null => false
    t.integer  "g1cli",      :limit => 3,  :default => 0,   :null => false
    t.integer  "g1free",     :limit => 3,  :default => 0,   :null => false
    t.integer  "g1leased",   :limit => 3,  :default => 0,   :null => false
    t.integer  "g1trunk",    :limit => 3,  :default => 0,   :null => false
    t.integer  "pbad",       :limit => 3,  :default => 0,   :null => false
    t.string   "pbadlist",   :limit => 32, :default => "0", :null => false
    t.integer  "pfree",      :limit => 3,  :default => 0,   :null => false
    t.integer  "phome",      :limit => 3,  :default => 0,   :null => false
    t.integer  "pleased",    :limit => 3,  :default => 0,   :null => false
    t.integer  "sigport",    :limit => 3,                   :null => false
    t.integer  "model_id"
    t.integer  "city_id"
    t.integer  "street_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "streets", :force => true do |t|
    t.string   "street",     :limit => 64, :null => false
    t.integer  "city_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "switches", :force => true do |t|
    t.date     "install"
    t.string   "active",      :limit => 11, :default => "prepared", :null => false
    t.string   "multicast",   :limit => 11, :default => "must",     :null => false
    t.string   "house",       :limit => 16,                         :null => false
    t.integer  "porch",       :limit => 3,  :default => 1,          :null => false
    t.string   "login",       :limit => 16,                         :null => false
    t.string   "password",    :limit => 16,                         :null => false
    t.string   "mac",         :limit => 18,                         :null => false
    t.string   "serial",      :limit => 64,                         :null => false
    t.string   "snmpw",       :limit => 16,                         :null => false
    t.integer  "num",         :limit => 3,  :default => 1,          :null => false
    t.integer  "pos",         :limit => 3,  :default => 1,          :null => false
    t.integer  "statport_id"
    t.integer  "model_id"
    t.integer  "city_id"
    t.integer  "street_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                             :null => false
    t.string   "email",                             :null => false
    t.string   "roles",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["roles"], :name => "index_users_on_roles", :unique => true

end
