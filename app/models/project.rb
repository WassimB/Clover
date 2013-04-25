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

  children :phases, :memberships

  belongs_to :owner, :class_name => "Junior", :creator => true, :inverse_of => :project
  has_many :memberships, :class_name => "ProjectMembership", :dependent => :destroy, :inverse_of => :project
  has_many :members, :through => :memberships, :source => :junior
  belongs_to :owner, :class_name => "Junior", :creator => true, :inverse_of => :projects

  # --- Permissions --- #

  def create_permitted?
    owner_is? acting_user
  end

  def update_permitted?
    acting_user.administrator? || (owner_is?(acting_user) && !owner_changed?)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    #true
    acting_user.administrator? || acting_user == owner || acting_user.in?(members)
  end

end
