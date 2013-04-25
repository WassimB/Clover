class Phase < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title       :string
    description :markdown
    status enum_string(:ongoing, :finished, :forthcoming, :halted)
    tasks_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :title, :description, :status, :project, :project_id, :tasks
  belongs_to :project, :inverse_of => :phases, :counter_cache => true
  has_many :tasks, :dependent => :destroy, :inverse_of => :phase, :order => :position

  children :tasks

  # --- Permissions --- #

  def create_permitted?
    project.creatable_by?(acting_user)
  end

  def update_permitted?
    project.updatable_by?(acting_user)
  end

  def destroy_permitted?
    project.destroyable_by?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end
