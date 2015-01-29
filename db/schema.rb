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

ActiveRecord::Schema.define(version: 20150119183849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_crowdblog_posts", force: true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "crowdblog_assets", force: true do |t|
    t.integer  "post_id"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crowdblog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.date     "published_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "author_id"
    t.string   "state"
    t.integer  "publisher_id"
    t.boolean  "ready_for_review"
    t.datetime "marked_for_review_at"
    t.datetime "finished_at"
  end

  create_table "crowdblog_status_change_records", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_dropbox_sessions", force: true do |t|
    t.integer  "user_id"
    t.text     "dropbox_session"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "delta_cursor"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "is_publisher"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "email",                default: "", null: false
    t.string   "encrypted_password",   default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "gravatar_alias"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "versions", ["created_at"], name: "index_versions_on_created_at", using: :btree
  add_index "versions", ["number"], name: "index_versions_on_number", using: :btree
  add_index "versions", ["tag"], name: "index_versions_on_tag", using: :btree
  add_index "versions", ["user_id", "user_type"], name: "index_versions_on_user_id_and_user_type", using: :btree
  add_index "versions", ["user_name"], name: "index_versions_on_user_name", using: :btree
  add_index "versions", ["versioned_id", "versioned_type"], name: "index_versions_on_versioned_id_and_versioned_type", using: :btree

end
