# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_03_125546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "first_user_id", null: false
    t.bigint "second_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_user_id"], name: "index_chats_on_first_user_id"
    t.index ["second_user_id"], name: "index_chats_on_second_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.boolean "like"
    t.text "content"
    t.bigint "experience_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_comments_on_experience_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.text "content"
    t.bigint "spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_experiences_on_spot_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_favourites_on_spot_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "first_user_id", null: false
    t.bigint "second_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_user_id"], name: "index_follows_on_first_user_id"
    t.index ["second_user_id"], name: "index_follows_on_second_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_reviews_on_spot_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.integer "difficulty"
    t.string "wave_type"
    t.integer "crowd"
    t.float "average_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.integer "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "users", column: "first_user_id"
  add_foreign_key "chats", "users", column: "second_user_id"
  add_foreign_key "comments", "experiences"
  add_foreign_key "comments", "users"
  add_foreign_key "experiences", "spots"
  add_foreign_key "experiences", "users"
  add_foreign_key "favourites", "spots"
  add_foreign_key "favourites", "users"
  add_foreign_key "follows", "users", column: "first_user_id"
  add_foreign_key "follows", "users", column: "second_user_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "spots"
  add_foreign_key "reviews", "users"
end
