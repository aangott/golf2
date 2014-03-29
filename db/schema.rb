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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140329202453) do

  create_table "matches", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "score1_id"
    t.integer  "score2_id"
    t.integer  "points1_id"
    t.integer  "points2_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches_players", :id => false, :force => true do |t|
    t.integer "match_id"
    t.integer "player_id"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "number"
    t.string   "flight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.float    "starting_avg"
  end

  create_table "points", :force => true do |t|
    t.integer  "value"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "course"
    t.string   "note"
  end

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.integer  "adjusted"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
