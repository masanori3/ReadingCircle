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

ActiveRecord::Schema.define(version: 20181026092724) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "name"
    t.string   "url"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.string   "title"
    t.datetime "reserved_at"
    t.integer  "attend"
    t.integer  "online"
    t.string   "online_detail"
    t.string   "offline_detail"
    t.integer  "capacity"
    t.integer  "minutes"
    t.text     "content",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "code"
    t.string   "name"
    t.string   "url"
    t.string   "image_url"
    t.index ["book_id"], name: "index_circles_on_book_id", using: :btree
    t.index ["user_id"], name: "index_circles_on_user_id", using: :btree
  end

  create_table "circles_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circles_users_on_circle_id", using: :btree
    t.index ["user_id", "circle_id"], name: "index_circles_users_on_user_id_and_circle_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_circles_users_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "check_box_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "microposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_microposts_on_circle_id", using: :btree
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "content",         limit: 65535
    t.string   "image"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_foreign_key "circles", "books"
  add_foreign_key "circles", "users"
  add_foreign_key "circles_users", "circles"
  add_foreign_key "circles_users", "users"
  add_foreign_key "microposts", "circles"
  add_foreign_key "microposts", "users"
end
