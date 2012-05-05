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

ActiveRecord::Schema.define(:version => 20120503121630) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "admin_id"
    t.boolean  "email_alert"
    t.string   "email_alert_frequency"
    t.boolean  "phone_alert"
    t.string   "phone_alert_frequency"
    t.string   "phone_events"
    t.string   "email_events"
    t.boolean  "active"
  end

  create_table "allowances", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "allowance_period"
    t.datetime "allowance_change_date"
    t.decimal  "balance_on_acd"
    t.decimal  "purchases_since_acd"
    t.decimal  "auto_authorize_under"
    t.decimal  "auto_deny_over"
    t.integer  "allowance_every"
  end

  create_table "merchants", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
    t.string   "email"
    t.decimal  "collected"
    t.decimal  "billed"
    t.string   "logo"
    t.string   "merchant_id"
    t.string   "merchant_site_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.decimal  "amount"
    t.string   "title"
    t.string   "description"
    t.boolean  "authorized"
    t.datetime "authorization_date"
    t.string   "authorization_type"
    t.string   "authorization_property"
    t.string   "authorization_value"
  end

  create_table "payment_getways", :force => true do |t|
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rules", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "action"
    t.string   "property"
    t.string   "value"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "parent_id"
    t.string   "phone"
    t.string   "facebook"
    t.string   "skype"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
