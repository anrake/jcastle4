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

ActiveRecord::Schema.define(version: 20140821231039) do

  create_table "castles", force: true do |t|
    t.boolean  "approved",                                   default: false
    t.integer  "user_id"
    t.string   "castle_name_en"
    t.string   "castle_name_ja"
    t.string   "castle_name_r"
    t.boolean  "has_ishigaki"
    t.boolean  "has_buildings"
    t.string   "kamon"
    t.string   "kamon_fam"
    t.string   "castle_name_alt"
    t.string   "founder"
    t.string   "year"
    t.string   "year_reconstructed"
    t.string   "castle_type"
    t.string   "structure"
    t.string   "artifacts"
    t.string   "location"
    t.string   "clongitude"
    t.string   "clatitude"
    t.integer  "gmapicn"
    t.string   "access"
    t.string   "website"
    t.string   "pro_web_name"
    t.string   "visited"
    t.text     "notes"
    t.text     "history"
    t.text     "shortdesc"
    t.string   "condition"
    t.string   "prefecture"
    t.string   "historical_value"
    t.string   "rating"
    t.string   "year_visited"
    t.string   "top_100"
    t.string   "has_NT"
    t.string   "has_ICP"
    t.string   "destination"
    t.string   "unesco"
    t.string   "period"
    t.integer  "bestZoom"
    t.string   "bestMap"
    t.decimal  "rating_average",     precision: 6, scale: 2, default: 0.0
    t.text     "notesJse"
    t.boolean  "manualUpdate"
    t.string   "ekiLatLng"
    t.integer  "ekiElev"
    t.integer  "castleElev"
    t.integer  "elevChange"
    t.string   "timeRequired"
    t.text     "visitorInfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "kokuin_matches", force: true do |t|
    t.integer "kokuin_id"
    t.integer "photo_id"
    t.boolean "combination", default: false
  end

  create_table "kokuins", force: true do |t|
    t.string   "thumbnail"
    t.text     "known_users"
    t.text     "description"
    t.text     "shortDesc"
    t.text     "descJse"
    t.text     "shortDescJse"
    t.string   "ktype"
    t.string   "ktype2"
    t.integer  "strokes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "castle_id"
    t.integer  "property_id"
    t.string   "fullpicture"
    t.string   "thumbnail"
    t.integer  "highlighted"
    t.string   "highlightPict"
    t.integer  "ispanorama",                               default: 0
    t.string   "struct_type"
    t.text     "description"
    t.text     "shortDesc"
    t.integer  "vieworder"
    t.string   "donatedBy"
    t.string   "donatedByLink"
    t.decimal  "plat",           precision: 19, scale: 14
    t.decimal  "plong",          precision: 19, scale: 14
    t.boolean  "has_gps"
    t.text     "descJse"
    t.text     "shortDescJse"
    t.boolean  "hide_profile",                             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "resources", force: true do |t|
    t.string   "name_en"
    t.string   "name_ja"
    t.string   "name_r"
    t.integer  "resource_id"
    t.integer  "resourceType"
    t.string   "fullpicture"
    t.string   "thumbnail"
    t.text     "description"
    t.text     "shortDesc"
    t.integer  "vieworder"
    t.decimal  "rlat",          precision: 19, scale: 14
    t.decimal  "rlong",         precision: 19, scale: 14
    t.boolean  "has_gps"
    t.text     "descJse"
    t.text     "shortDescJse"
    t.string   "highlightPict"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
