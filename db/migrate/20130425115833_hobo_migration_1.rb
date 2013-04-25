class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string   :description
      t.date     :deadline
      t.string   :type
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :phase_id
    end
    add_index :tasks, [:phase_id]

    create_table :phases do |t|
      t.string   :title
      t.text     :description
      t.string   :status
      t.integer  :tasks_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
    end
    add_index :phases, [:project_id]

    create_table :projects do |t|
      t.string   :name
      t.integer  :phases_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :task_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :junior_id
      t.integer  :task_id
    end
    add_index :task_assignments, [:junior_id]
    add_index :task_assignments, [:task_id]
  end

  def self.down
    drop_table :tasks
    drop_table :phases
    drop_table :projects
    drop_table :task_assignments
  end
end
