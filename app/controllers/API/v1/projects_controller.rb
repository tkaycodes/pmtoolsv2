class Api::V1::ProjectsController < ApplicationController

  def index
    @projects = Project.all
    # render json: @projects
  end

  def show
    @project = Project.find params[:id]
    @tasks= @project.tasks.all
  end
end
