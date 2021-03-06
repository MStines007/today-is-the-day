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

ActiveRecord::Schema.define(version: 20150329185604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.datetime "date"
    t.string   "to_name"
    t.string   "to_email"
    t.string   "from_name"
    t.string   "from_email"
  end

  create_table "giphy_items", force: :cascade do |t|
    t.datetime "date"
    t.integer  "collection_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.datetime "date"
    t.integer  "collection_id"
    t.string   "headline"
    t.string   "snippet"
    t.string   "link"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  create_table "wiki_birth_items", force: :cascade do |t|
    t.datetime "date"
    t.integer  "collection_id"
    t.string   "birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "wiki_event_items", force: :cascade do |t|
    t.datetime "date"
    t.integer  "collection_id"
    t.string   "event"
  end

  create_table "wiki_holiday_items", force: :cascade do |t|
    t.datetime "date"
    t.integer  "collection_id"
    t.string   "holiday"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
