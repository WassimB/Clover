class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string
    deadline    :date
    type        :string
    timestamps
  end
  attr_accessible :description, :deadline, :type

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