# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_08_155009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "postcode"
    t.string "website"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_clubs_on_name", unique: true
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer "zone_id"
    t.string "zone_name"
    t.datetime "start_time"
    t.string "home_club"
    t.string "bye_teams"
    t.string "start_sheet_skeleton"
    t.string "start_sheet_official"
    t.string "team_overall"
    t.string "person_overall"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["zone_id"], name: "index_fixtures_on_zone_id"
    t.index ["zone_name", "home_club"], name: "index_fixtures_on_zone_name_and_home_club", unique: true
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "zone_id"
    t.bigint "club_id"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["club_id"], name: "index_memberships_on_club_id"
    t.index ["zone_id"], name: "index_memberships_on_zone_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "exact_handicap"
    t.string "home_club"
    t.integer "pin"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "club_id"
    t.index ["club_id"], name: "index_players_on_club_id"
    t.index ["first_name", "surname", "home_club"], name: "index_players_on_first_name_and_surname_and_home_club", unique: true
    t.index ["pin"], name: "index_players_on_pin", unique: true
  end

  create_table "team_sheets", force: :cascade do |t|
    t.integer "fixture_id"
    t.integer "club_id"
    t.string "player_1"
    t.string "player_2"
    t.string "player_3"
    t.string "player_4"
    t.string "player_5"
    t.string "player_6"
    t.string "player_7"
    t.string "player_8"
    t.string "guest_1"
    t.string "guest_2"
    t.string "guest_3"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["club_id"], name: "index_team_sheets_on_club_id"
    t.index ["fixture_id"], name: "index_team_sheets_on_fixture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.integer "club_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "league"
    t.string "rep"
    t.string "rep_club"
    t.string "team_overall_url"
    t.string "person_overall_url"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_zones_on_name", unique: true
  end

end
