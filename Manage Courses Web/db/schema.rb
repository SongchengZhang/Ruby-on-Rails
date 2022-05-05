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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_021759) do
  create_table "application_forms", force: :cascade do |t|
    t.text "details"
    t.text "qualifications"
    t.string "userEmail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_attributes", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.text "description"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_attributes_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "term"
    t.string "effectiveDate"
    t.string "effectiveStatus"
    t.string "title"
    t.string "shortDescription"
    t.text "description"
    t.string "equivalentId"
    t.string "allowMultiEnroll"
    t.integer "maxUnits"
    t.integer "minUnits"
    t.integer "repeatUnitsLimit"
    t.string "grading"
    t.string "component"
    t.string "primaryComponent"
    t.string "offeringNumber"
    t.string "subject"
    t.string "catalogNumber"
    t.string "campus"
    t.string "academicOrg"
    t.string "academicCareer"
    t.string "cipCode"
    t.string "campusCode"
    t.string "catalogLevel"
    t.string "subjectDesc"
    t.string "courseId"
    t.string "instructor_email"
    t.integer "maxNumber", default: 0
    t.integer "graderNumber", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "instructor_id"
    t.string "student_email"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "section_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_graders_on_course_id"
    t.index ["section_id"], name: "index_graders_on_section_id"
    t.index ["user_id"], name: "index_graders_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "student_num"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "meetingNumber"
    t.integer "facilityId"
    t.string "facilityType"
    t.text "faciltyDescription"
    t.string "facilityDescriptionShort"
    t.string "facilityGroup"
    t.integer "facilityCapacity"
    t.string "buildingCode"
    t.string "room"
    t.text "buildingDescription"
    t.string "buildingDescriptionShort"
    t.string "startTime"
    t.string "endTime"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.string "standingMeetingPattern"
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_meetings_on_section_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "student_email"
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "classNumber"
    t.string "section"
    t.string "instructionMode"
    t.integer "courseOfferingNumber"
    t.string "academicGroup"
    t.string "subject"
    t.string "career"
    t.string "description"
    t.string "enrollmentStatus"
    t.string "type"
    t.string "associatedClass"
    t.boolean "autoEnrollWaitlist"
    t.boolean "autoEnrollSection1"
    t.boolean "autoEnrollSection2"
    t.boolean "consent"
    t.integer "waitlistCapacity"
    t.integer "minimumEnrollment"
    t.integer "enrollmentTotal"
    t.integer "waitlistTotal"
    t.string "academicOrg"
    t.string "location"
    t.string "equivalentCourseId"
    t.string "startDate"
    t.string "endDate"
    t.string "cancelDate"
    t.string "primaryInstructorSession"
    t.string "combinedSection"
    t.string "holidaySchedule"
    t.string "sessionCode"
    t.string "sessionDescription"
    t.string "secCampus"
    t.string "secAcademicGroup"
    t.string "secCatalogNumber"
    t.string "meetingDays"
    t.string "subjectDesc"
    t.string "termCode"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "apply", default: 0
    t.integer "gApply", default: 0
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_attributes", "courses"
  add_foreign_key "graders", "courses"
  add_foreign_key "graders", "sections"
  add_foreign_key "graders", "users"
  add_foreign_key "meetings", "sections"
  add_foreign_key "sections", "courses"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
end
