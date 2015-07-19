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

ActiveRecord::Schema.define(version: 20150715122502) do

  create_table "castles", force: :cascade do |t|
    t.boolean  "approved",           limit: 1,                             default: false
    t.integer  "user_id",            limit: 4
    t.string   "castle_name_en",     limit: 255
    t.string   "castle_name_ja",     limit: 255
    t.string   "castle_name_r",      limit: 255
    t.boolean  "has_ishigaki",       limit: 1
    t.boolean  "has_buildings",      limit: 1
    t.string   "kamon",              limit: 255
    t.string   "kamon_fam",          limit: 255
    t.string   "castle_name_alt",    limit: 255
    t.string   "founder",            limit: 255
    t.string   "year",               limit: 255
    t.string   "year_reconstructed", limit: 255
    t.string   "castle_type",        limit: 255
    t.string   "structure",          limit: 255
    t.string   "artifacts",          limit: 255
    t.string   "location",           limit: 255
    t.string   "clongitude",         limit: 255
    t.string   "clatitude",          limit: 255
    t.integer  "gmapicn",            limit: 4
    t.string   "access",             limit: 255
    t.string   "website",            limit: 255
    t.string   "pro_web_name",       limit: 255
    t.string   "visited",            limit: 255
    t.text     "notes",              limit: 65535
    t.text     "history",            limit: 65535
    t.text     "shortdesc",          limit: 65535
    t.string   "condition",          limit: 255
    t.string   "prefecture",         limit: 255
    t.string   "historical_value",   limit: 255
    t.string   "rating",             limit: 255
    t.string   "year_visited",       limit: 255
    t.string   "top_100",            limit: 255
    t.string   "has_NT",             limit: 255
    t.string   "has_ICP",            limit: 255
    t.string   "destination",        limit: 255
    t.string   "unesco",             limit: 255
    t.string   "period",             limit: 255
    t.integer  "bestZoom",           limit: 4
    t.string   "bestMap",            limit: 255
    t.decimal  "rating_average",                   precision: 6, scale: 2, default: 0.0
    t.text     "notesJse",           limit: 65535
    t.boolean  "manualUpdate",       limit: 1
    t.string   "ekiLatLng",          limit: 255
    t.integer  "ekiElev",            limit: 4
    t.integer  "castleElev",         limit: 4
    t.integer  "elevChange",         limit: 4
    t.string   "timeRequired",       limit: 255
    t.text     "visitorInfo",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment",           limit: 65535
    t.integer  "commentable_id",    limit: 4
    t.string   "commentable_type",  limit: 255
    t.string   "commenter",         limit: 255,   default: "Anonymous"
    t.string   "commenter_website", limit: 255
    t.string   "commenter_email",   limit: 255
    t.integer  "page_id",           limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "oauth_token",      limit: 255
    t.string   "oauth_secret",     limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "kokuin_matches", force: :cascade do |t|
    t.integer "kokuin_id",   limit: 4
    t.integer "photo_id",    limit: 4
    t.boolean "combination", limit: 1, default: false
  end

  create_table "kokuins", force: :cascade do |t|
    t.string   "thumbnail",    limit: 255
    t.text     "known_users",  limit: 65535
    t.text     "description",  limit: 65535
    t.text     "shortDesc",    limit: 65535
    t.text     "descJse",      limit: 65535
    t.text     "shortDescJse", limit: 65535
    t.string   "ktype",        limit: 255
    t.string   "ktype2",       limit: 255
    t.integer  "strokes",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "castle_id",      limit: 4
    t.integer  "property_id",    limit: 4
    t.string   "fullpicture",    limit: 255
    t.string   "thumbnail",      limit: 255
    t.integer  "highlighted",    limit: 4
    t.string   "highlightPict",  limit: 255
    t.integer  "ispanorama",     limit: 4,                               default: 0
    t.string   "struct_type",    limit: 255
    t.text     "description",    limit: 65535
    t.text     "shortDesc",      limit: 65535
    t.integer  "vieworder",      limit: 4
    t.string   "donatedBy",      limit: 255
    t.string   "donatedByLink",  limit: 255
    t.decimal  "plat",                         precision: 19, scale: 14
    t.decimal  "plong",                        precision: 19, scale: 14
    t.boolean  "has_gps",        limit: 1
    t.text     "descJse",        limit: 65535
    t.text     "shortDescJse",   limit: 65535
    t.boolean  "hide_profile",   limit: 1,                               default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name_en",       limit: 255
    t.string   "name_ja",       limit: 255
    t.string   "name_r",        limit: 255
    t.integer  "resource_id",   limit: 4
    t.integer  "resourceType",  limit: 4
    t.string   "fullpicture",   limit: 255
    t.string   "thumbnail",     limit: 255
    t.text     "description",   limit: 65535
    t.text     "shortDesc",     limit: 65535
    t.integer  "vieworder",     limit: 4
    t.decimal  "rlat",                        precision: 19, scale: 14
    t.decimal  "rlong",                       precision: 19, scale: 14
    t.boolean  "has_gps",       limit: 1
    t.text     "descJse",       limit: 65535
    t.text     "shortDescJse",  limit: 65535
    t.string   "highlightPict", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
