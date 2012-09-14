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

ActiveRecord::Schema.define(:version => 20120914214205) do

  create_table "member_month_reports", :force => true do |t|
    t.string   "member_id"
    t.integer  "year"
    t.integer  "month"
    t.float    "shifts_worked",   :default => 0.0
    t.float    "carryover_hours", :default => 0.0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "coop_id"
    t.string   "first_name",                       :null => false
    t.string   "last_name",                        :null => false
    t.string   "email_address",                    :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.float    "carryover_hours", :default => 0.0
    t.float    "current_hours",   :default => 0.0
  end

  add_index "members", ["coop_id"], :name => "index_members_on_coop_id", :unique => true
  add_index "members", ["email_address"], :name => "index_members_on_email_address", :unique => true

  create_table "time_entries", :force => true do |t|
    t.datetime "date_worked",                   :null => false
    t.float    "hours_worked",                  :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "coop_id",      :default => "0", :null => false
    t.string   "description"
  end

end
