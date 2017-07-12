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

ActiveRecord::Schema.define(version: 20170712184745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_conversations_on_post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "odometer"
    t.decimal "price", precision: 10, scale: 2
    t.integer "model_year"
    t.string "condition"
    t.integer "cylinders"
    t.string "drivetrain"
    t.string "fuel"
    t.string "paint_colour"
    t.string "title_status"
    t.string "transmission_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.bigint "user_id"
    t.string "imageurl", default: "placeholder.jpg"
    t.index ["condition"], name: "index_posts_on_condition"
    t.index ["cylinders"], name: "index_posts_on_cylinders"
    t.index ["drivetrain"], name: "index_posts_on_drivetrain"
    t.index ["fuel"], name: "index_posts_on_fuel"
    t.index ["make"], name: "index_posts_on_make"
    t.index ["model"], name: "index_posts_on_model"
    t.index ["model_year"], name: "index_posts_on_model_year"
    t.index ["odometer"], name: "index_posts_on_odometer"
    t.index ["paint_colour"], name: "index_posts_on_paint_colour"
    t.index ["price"], name: "index_posts_on_price"
    t.index ["title_status"], name: "index_posts_on_title_status"
    t.index ["transmission_type"], name: "index_posts_on_transmission_type"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "conversations", "posts"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "users"
end
