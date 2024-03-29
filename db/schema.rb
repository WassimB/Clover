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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130426125502) do

  create_table "juniors", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "inactive"
    t.datetime "key_timestamp"
  end

  add_index "juniors", ["state"], :name => "index_juniors_on_state"

  create_table "phases", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.integer  "tasks_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "phases", ["project_id"], :name => "index_phases_on_project_id"

  create_table "project_memberships", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "junior_id"
    t.boolean  "contributor", :default => false
  end

  add_index "project_memberships", ["junior_id"], :name => "index_project_memberships_on_junior_id"
  add_index "project_memberships", ["project_id"], :name => "index_project_memberships_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "phases_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "projects", ["owner_id"], :name => "index_projects_on_owner_id"

  create_table "task_assignments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "junior_id"
    t.integer  "task_id"
  end

  add_index "task_assignments", ["junior_id"], :name => "index_task_assignments_on_junior_id"
  add_index "task_assignments", ["task_id"], :name => "index_task_assignments_on_task_id"

  create_table "tasks", :force => true do |t|
    t.string   "description"
    t.date     "deadline"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phase_id"
    t.integer  "position"
    t.string   "fee"
  end

  add_index "tasks", ["phase_id"], :name => "index_tasks_on_phase_id"

end
