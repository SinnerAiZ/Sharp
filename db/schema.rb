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

ActiveRecord::Schema.define(version: 20161209160320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "pwd"
    t.string   "username"
    t.integer  "phone"
    t.integer  "email"
    t.boolean  "is_teacher"
    t.boolean  "is_vip"
    t.boolean  "is_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.string   "number"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "mark"
    t.integer  "manner"
    t.integer  "level"
    t.integer  "pattern"
    t.string   "content"
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer  "price"
    t.string   "place"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "category"
    t.string   "class_time"
    t.integer  "times"
    t.boolean  "is_public",  default: false
    t.string   "intro"
    t.float    "score"
    t.string   "stage",      default: "waiting"
  end

  create_table "courses_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "address"
    t.string   "school"
    t.string   "grade"
    t.string   "student_class"
    t.string   "intro"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "account_id"
    t.date     "bornday"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "address"
    t.string   "school"
    t.string   "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
    t.date     "bornday"
    t.float    "score"
  end

  add_foreign_key "accounts", "students"
  add_foreign_key "accounts", "teachers"
  add_foreign_key "students", "accounts"
  add_foreign_key "teachers", "accounts"
end
