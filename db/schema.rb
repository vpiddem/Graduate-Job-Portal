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

ActiveRecord::Schema.define(version: 20140930002721) do

  create_table "admin_users", force: true do |t|
    t.string   "admin_name",                         null: false
    t.string   "email",                 default: "", null: false
    t.string   "password",   limit: 50,              null: false
    t.string   "user_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "admin_user_id"
    t.string   "name"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["admin_user_id"], name: "index_categories_on_admin_user_id", using: :btree

  create_table "employers", force: true do |t|
    t.string   "company_name"
    t.integer  "admin_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "job_seeker_id"
    t.integer  "status",               default: 0
    t.text     "cover_letter"
    t.datetime "application_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_applications", ["job_id", "job_seeker_id"], name: "index_job_applications_on_job_id_and_job_seeker_id", unique: true, using: :btree

  create_table "job_seekers", force: true do |t|
    t.string   "first_name",   limit: 50, null: false
    t.string   "last_name",    limit: 50, null: false
    t.string   "user_id"
    t.string   "phone_number"
    t.string   "skills"
    t.text     "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_tags", force: true do |t|
    t.integer  "job_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "application_deadline"
    t.integer  "category_id"
    t.integer  "employers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "tag_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 1,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
