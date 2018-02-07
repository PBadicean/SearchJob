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

ActiveRecord::Schema.define(version: 20180206153755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_info", force: :cascade do |t|
    t.string "place_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidate_info_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "employer_info", force: :cascade do |t|
    t.string "company_name", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employer_info_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.datetime "date_start", null: false
    t.datetime "date_end", null: false
    t.string "company", null: false
    t.string "duty", null: false
    t.bigint "resume_id", null: false
    t.string "position", null: false
    t.index ["resume_id"], name: "index_experiences_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "position", null: false
    t.integer "salary", null: false
    t.integer "user_id", null: false
    t.string "about_me", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.index ["category_id"], name: "index_resumes_on_category_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "name"
    t.string "avatar"
    t.date "birthday"
    t.integer "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "name", null: false
    t.string "place_id", null: false
    t.integer "user_id", null: false
    t.text "discription", null: false
    t.integer "schedule", null: false
    t.integer "experience", null: false
    t.string "key_skills"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salary_start"
    t.integer "salary_end"
    t.index ["place_id"], name: "index_vacancies_on_place_id"
    t.index ["user_id"], name: "index_vacancies_on_user_id"
  end

end
