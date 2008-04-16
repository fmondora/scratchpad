# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 2) do

  create_table "balance", :force => true do |t|
    t.string   "profile"
    t.integer  "type"
    t.integer  "moo"
    t.datetime "date"
  end

  create_table "mutransaction", :id => false, :force => true do |t|
    t.integer  "id_transaction",                :null => false
    t.float    "tasso"
    t.string   "beneficiario"
    t.string   "ordinante"
    t.string   "causale"
    t.integer  "cows"
    t.datetime "date"
    t.integer  "state"
    t.string   "tags",           :limit => 500
    t.integer  "scope"
  end

  create_table "profile", :id => false, :force => true do |t|
    t.string  "user_id",      :null => false
    t.string  "email"
    t.integer "freezed_cows"
    t.integer "cows"
    t.string  "password"
    t.string  "name"
    t.string  "role"
  end

  create_table "promotion", :id => false, :force => true do |t|
    t.string   "id_promotion", :null => false
    t.string   "type",         :null => false
    t.string   "profile_id"
    t.datetime "expiry_date"
    t.string   "issuer_id"
    t.boolean  "still_valid"
    t.integer  "transaction"
    t.integer  "moo"
  end

  create_table "sample", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
