class TasksController < ApplicationController

      before_action :authenticate_user!, :only => [:create]
  def create
    @project=Project.find(params[:project_id])
    @task=@project.tasks.new(params.require(:task).permit( [:title, :body] ))
    if @task.save
    redirect_to @project, notice: "Task created!"
    else
    flash.now[:alert] = "Something went wrong. try again please!"
    redirect_to @project
    end
  end

  def destroy
    @project=Project.find(params[:project_id])
    @task=Task.find(params[:id])
    if @task.destroy
        redirect_to project_path, notice:"Task Deleted!"
    else
        redirect_to project_path, notice:"There was an error while deleting task, try again!"
    end

end


end
