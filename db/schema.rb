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

ActiveRecord::Schema.define(version: 2020_05_16_210729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dreamposts", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "likes_count", default: 0, null: false
    t.integer "in_reply_to", default: 0, null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id", "created_at"], name: "index_dreamposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_dreamposts_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dreampost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dreampost_id"], name: "index_likes_on_dreampost_id"
    t.index ["user_id", "dreampost_id"], name: "index_likes_on_user_id_and_dreampost_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "title"
    t.text "comment"
    t.string "picture"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_maps_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile"], name: "index_users_on_profile"
  end

  add_foreign_key "dreamposts", "users"
  add_foreign_key "likes", "dreamposts"
  add_foreign_key "likes", "users"
  add_foreign_key "maps", "users"
end
