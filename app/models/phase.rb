class Phase < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title       :string
    description :text
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
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.signed_up? && !project_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
