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

ActiveRecord::Schema.define(version: 20160203222515) do

  create_table "businesses", force: :cascade do |t|
    t.string   "yelp_id",      limit: 255
    t.string   "name",         limit: 255
    t.string   "full_address", limit: 255
    t.string   "city",         limit: 255
    t.string   "categories",   limit: 255
    t.string   "longitude",    limit: 255
    t.string   "latitude",     limit: 255
    t.integer  "review_count", limit: 4
    t.integer  "stars",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "yelp_id",          limit: 255
    t.string   "yelp_user_id",     limit: 255
    t.string   "yelp_business_id", limit: 255
    t.integer  "funny_count",      limit: 4
    t.integer  "useful_count",     limit: 4
    t.integer  "cool_count",       limit: 4
    t.text     "text",             limit: 65535
    t.integer  "stars",            limit: 4
    t.date     "date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "reviews", ["yelp_business_id"], name: "index_reviews_on_yelp_business_id", using: :btree
  add_index "reviews", ["yelp_id"], name: "index_reviews_on_yelp_id", using: :btree
  add_index "reviews", ["yelp_user_id"], name: "index_reviews_on_yelp_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "yelp_id",                        limit: 255
    t.string "id_nearest_neighbour_1",         limit: 255
    t.float  "proximity_nearest_neighbour_1",  limit: 24
    t.string "id_nearest_neighbour_2",         limit: 255
    t.float  "proximity_nearest_neighbour_2",  limit: 24
    t.string "id_nearest_neighbour_3",         limit: 255
    t.float  "proximity_nearest_neighbour_3",  limit: 24
    t.string "id_nearest_neighbour_4",         limit: 255
    t.float  "proximity_nearest_neighbour_4",  limit: 24
    t.string "id_nearest_neighbour_5",         limit: 255
    t.float  "proximity_nearest_neighbour_5",  limit: 24
    t.string "id_nearest_neighbour_6",         limit: 255
    t.float  "proximity_nearest_neighbour_6",  limit: 24
    t.string "id_nearest_neighbour_7",         limit: 255
    t.float  "proximity_nearest_neighbour_7",  limit: 24
    t.string "id_nearest_neighbour_8",         limit: 255
    t.float  "proximity_nearest_neighbour_8",  limit: 24
    t.string "id_nearest_neighbour_9",         limit: 255
    t.float  "proximity_nearest_neighbour_9",  limit: 24
    t.string "id_nearest_neighbour_10",        limit: 255
    t.float  "proximity_nearest_neighbour_10", limit: 24
  end

end
