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

ActiveRecord::Schema.define(version: 20171005154330) do

  create_table "entertainers", force: :cascade do |t|
    t.string "username"
    t.string "job_type"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rate"
    t.text "description"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "host_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "closed_status", default: false
    t.string "duration"
    t.string "job_needs"
    t.string "city"
    t.string "state"
  end

  create_table "events_entertainers", force: :cascade do |t|
    t.integer "entertainer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "host_id"
    t.integer "entertainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender"
    t.string "receiver"
  end

end
