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

ActiveRecord::Schema.define(version: 20161119064629) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "status",             default: "Pending"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "diagnosis_record"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.integer  "physical_record_id"
    t.integer  "schedule_id"
    t.text     "symptom"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "proficiency"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nurses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.text     "allergyRecordList"
    t.string   "bloodType"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "pharmacists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physical_records", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "height"
    t.string   "bloodPressure"
    t.integer  "heartRate"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "appointment_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "appointment_id"
    t.string   "med"
    t.integer  "no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "shift"
    t.date     "date"
    t.integer  "appointment", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
<<<<<<< HEAD
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "user_type_type",         limit: 10,                 null: false
    t.integer  "user_type_id",                                      null: false
    t.string   "national_id",                                       null: false
    t.string   "sex",                    limit: 1,                  null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "phone_number",                                      null: false
    t.boolean  "ban",                               default: false, null: false
    t.integer  "ext_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_type_type", "user_type_id"], name: "index_users_on_user_type_type_and_user_type_id", unique: true, using: :btree
    t.index ["user_type_type"], name: "index_users_on_user_type_type", using: :btree
=======
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "user_type_type"
    t.integer  "user_type_id"
    t.integer  "national_id"
    t.string   "sex"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.boolean  "ban",                    default: false, null: false
    t.integer  "ext_id",                 default: -1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_type", "user_type_id"], name: "index_users_on_user_type_type_and_user_type_id", unique: true
    t.index ["user_type_type"], name: "index_users_on_user_type_type"
>>>>>>> origin/benzbranch
  end

end
