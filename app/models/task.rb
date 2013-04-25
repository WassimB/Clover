class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string
    deadline    :date
    type        :string
    timestamps
  end
  attr_accessible :description, :deadline, :type, :phase, :phase_id, :task_assignments, :juniors
  belongs_to :phase, :inverse_of => :tasks, :counter_cache => true
  has_many :task_assignments, :dependent => :destroy, :inverse_of => :task
  has_many :juniors, :through => :task_assignments, :accessible => true, :dependent => :destroy

  acts_as_list :scope => :phase

  # --- Permissions --- #

  def create_permitted?
    phase.creatable_by?(acting_user)
  end

  def update_permitted?
    phase.updatable_by?(acting_user)
  end

  def destroy_permitted?
    phase.destroyable_by?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end
