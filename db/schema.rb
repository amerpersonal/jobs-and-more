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

ActiveRecord::Schema.define(version: 2021_11_06_063243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "first_name", limit: 30
    t.string "last_name", limit: 30
    t.date "birth_date"
    t.string "email"
    t.string "phone_number", limit: 15
    t.string "address"
    t.string "competence", limit: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_applications_on_email"
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["name"], name: "index_companies_on_name"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "category_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_jobs_on_category_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["title"], name: "index_jobs_on_title"
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "jobs", "categories"
  add_foreign_key "jobs", "companies"
end