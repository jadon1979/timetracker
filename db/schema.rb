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

ActiveRecord::Schema.define(version: 20170806150649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_employees_on_role_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "summary"
    t.text "description"
    t.integer "story_points"
    t.bigint "project_id", default: 0
    t.integer "creator_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_features_on_creator_id"
    t.index ["project_id"], name: "index_features_on_project_id"
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.text "description"
    t.bigint "project_status_id", default: 0
    t.integer "creator_id", default: 0
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_projects_on_creator_id"
    t.index ["project_status_id"], name: "index_projects_on_project_status_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_resources", force: :cascade do |t|
    t.string "summary"
    t.bigint "employee_id"
    t.bigint "task_id"
    t.float "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_task_resources_on_employee_id"
    t.index ["task_id"], name: "index_task_resources_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "summary"
    t.boolean "completed", default: false
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_tasks_on_feature_id"
  end

  add_foreign_key "employees", "roles"
  add_foreign_key "features", "projects"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "task_resources", "employees"
  add_foreign_key "task_resources", "tasks"
  add_foreign_key "tasks", "features"
end
