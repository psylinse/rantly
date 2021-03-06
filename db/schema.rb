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

ActiveRecord::Schema.define(version: 20141107215817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id",        null: false
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "rant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", force: true do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["follower_id", "following_id"], name: "index_followings_on_follower_id_and_following_id", unique: true, using: :btree

  create_table "rants", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "spam",       default: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "type_of_ranter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "admin",              default: false
    t.boolean  "disabled",           default: false, null: false
    t.string   "confirmation_token"
    t.string   "email"
  end

end
