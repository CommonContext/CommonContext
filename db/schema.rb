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

ActiveRecord::Schema.define(version: 20170226194645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "location"
    t.integer  "mentor_rating"
    t.integer  "mentee_rating"
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["mentee_id"], name: "index_appointments_on_mentee_id", using: :btree
    t.index ["mentor_id"], name: "index_appointments_on_mentor_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_matches_on_mentee_id", using: :btree
    t.index ["mentor_id"], name: "index_matches_on_mentor_id", using: :btree
  end

  create_table "mentees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.text     "objective"
    t.boolean  "mentor_demographic_pref"
    t.string   "race"
    t.string   "gender"
    t.string   "linkedin_link"
    t.string   "socioeconomic_background"
    t.string   "orientation"
    t.string   "other"
    t.string   "location"
    t.text     "interests"
    t.boolean  "good_standing"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "last_name"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_mentees_on_user_id", using: :btree
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.integer  "years_of_experience"
    t.string   "current_company"
    t.string   "current_industry"
    t.string   "linkedin_link"
    t.datetime "availability"
    t.string   "race"
    t.string   "gender"
    t.string   "socioeconomic_background"
    t.string   "orientation"
    t.string   "other"
    t.string   "location"
    t.text     "interests"
    t.boolean  "good_standing"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "last_name"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_mentors_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

end
