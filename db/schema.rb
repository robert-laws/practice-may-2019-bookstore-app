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

ActiveRecord::Schema.define(version: 2019_05_31_064116) do

  create_table "addresses", force: :cascade do |t|
    t.string "street_1", limit: 25
    t.string "street_2", limit: 25
    t.string "city", limit: 25
    t.string "state", limit: 2
    t.integer "zip_code", limit: 5
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_addresses_on_author_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 25
    t.integer "birth_year", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_genres", force: :cascade do |t|
    t.string "genre", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_shops", force: :cascade do |t|
    t.integer "book_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_shops_on_book_id"
    t.index ["shop_id"], name: "index_book_shops_on_shop_id"
  end

  create_table "book_subjects", force: :cascade do |t|
    t.integer "book_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_subjects_on_book_id"
    t.index ["subject_id"], name: "index_book_subjects_on_subject_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", limit: 50
    t.integer "publication_year", limit: 4
    t.text "description"
    t.float "price"
    t.integer "author_id"
    t.integer "book_genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "open_date"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
