class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
    @project = find_instance
    @phases = @project.phases.
      search(params[:search], :title).
      order_by(parse_sort_param(:title, :status))
    hobo_show
  end

end
