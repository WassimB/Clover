class PhasesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
  
  auto_actions_for :project, [:new, :create]

    def show
    @phase = find_instance
    @tasks = @phase.tasks.
      search(params[:search], :description).
      order_by(parse_sort_param(:description, :deadline, :fee))
    hobo_show
  end
end
