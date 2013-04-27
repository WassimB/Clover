class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :tasks, :fee, :string
  end

  def self.down
    remove_column :tasks, :fee
  end
end
