class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :project_memberships do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :junior_id
    end
    add_index :project_memberships, [:project_id]
    add_index :project_memberships, [:junior_id]
  end

  def self.down
    drop_table :project_memberships
  end
end
