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

ActiveRecord::Schema[7.1].define(version: 2024_05_26_104508) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "detail"
    t.integer "available", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.integer "status", limit: 1, default: 0
    t.boolean "advisor_approved", default: false
    t.datetime "exam_date"
    t.string "place"
    t.string "chair"
    t.string "com1"
    t.string "com2"
    t.string "com3"
    t.string "ex_com"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_exams_on_proposal_id"
  end

  create_table "faculties", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "degree"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.string "name_th"
    t.string "name_en"
    t.bigint "advisor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_proposals_on_advisor_id"
    t.index ["student_id"], name: "index_proposals_on_student_id"
  end

  create_table "students", charset: "utf8mb3", force: :cascade do |t|
    t.string "cuid"
    t.string "name"
    t.integer "program"
    t.integer "start_term", default: 1
    t.integer "start_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "program_id"
    t.index ["program_id"], name: "index_students_on_program_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", limit: 1, default: 0
    t.boolean "admin", default: false
    t.datetime "last_login"
    t.bigint "student_id"
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_users_on_faculty_id"
    t.index ["student_id"], name: "index_users_on_student_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "exams", "proposals"
  add_foreign_key "proposals", "faculties", column: "advisor_id"
  add_foreign_key "proposals", "students"
  add_foreign_key "students", "programs"
end
