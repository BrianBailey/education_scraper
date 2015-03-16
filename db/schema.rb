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

ActiveRecord::Schema.define(version: 20150314011909) do

  create_table "posts", force: :cascade do |t|
    t.string   "speaker_state"
    t.string   "speaker_first"
    t.string   "speaker_last"
    t.string   "speaker_party"
    t.text     "speaking"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "chamber"
    t.text     "title"
    t.text     "date"
    t.string   "origin_url"
    t.integer  "number"
    t.integer  "order"
    t.integer  "volume"
    t.string   "pages"
    t.string   "bioguide_id"
    t.string   "speaker_raw"
  end

end
