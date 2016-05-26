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

ActiveRecord::Schema.define(version: 20160525162308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.boolean  "flag"
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "films", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.boolean  "winner"
    t.boolean  "live"
    t.text     "cast"
    t.text     "crew"
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "films", ["category_id"], name: "index_films_on_category_id", using: :btree
  add_index "films", ["name"], name: "index_films_on_name", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.float    "value",      default: 0.0, null: false
    t.integer  "user_id",                  null: false
    t.integer  "film_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ratings", ["film_id"], name: "index_ratings_on_film_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body"
    t.integer  "film_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["film_id"], name: "index_reviews_on_film_id", using: :btree
  add_index "reviews", ["title"], name: "index_reviews_on_title", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "token",                     null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tokens", ["token"], name: "index_tokens_on_token", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.boolean  "judge"
    t.string   "judge_token"
    t.boolean  "organizer"
    t.string   "organizer_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
