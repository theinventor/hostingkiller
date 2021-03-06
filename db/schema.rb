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

ActiveRecord::Schema.define(version: 20140310195745) do

  create_table "comments", force: true do |t|
    t.integer  "support_request_id"
    t.string   "from"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_requests", force: true do |t|
    t.string   "domain"
    t.string   "customer_email"
    t.string   "name"
    t.string   "phone"
    t.boolean  "want_to_cancel"
    t.string   "balance_due"
    t.boolean  "paid"
    t.text     "paypal_params"
    t.string   "registrar"
    t.text     "whois"
    t.string   "ip_address"
    t.string   "cpanel_user"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "disabled",       default: false
  end

end
