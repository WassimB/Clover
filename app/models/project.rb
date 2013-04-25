class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    phases_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :name
  attr_accessible :name, :phases
  has_many :phases, :dependent => :destroy, :inverse_of => :project

  children :phases

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
