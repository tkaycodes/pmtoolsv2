class TasksController < ApplicationController

  before_action :authenticate_user!, :only => [:create]
  

    def create
      @project=Project.find(params[:project_id])
      @task=@project.tasks.new(params.require(:task).permit( [:title, :body] ))
      
      respond_to do |format|
        if @task.save
        format.html{redirect_to @project, notice: "Task created!"}
        # format.js{render js: "alert('created');"}
        # format.json{render json: @task}
         format.js{render}
        else
        format.html {
        flash.now[:alert] = "Something went wrong. try again please!"
        redirect_to @project }
        format.js {render js: "alert('ERROR');"}
        end
      end
    end


    def destroy
      @project=Project.find(params[:project_id])
      @task=Task.find(params[:id])

      respond_to do |format|
        if @task.destroy
        format.html{redirect_to project_path(@project), notice:"Task Deleted!"}
          # format.js{render js:"alert('deleted!');"}
            format.js{render}
        else
        format.html{
        redirect_to project_path, 
        notice:"There was an error while deleting task, try again!"}
        format.js {render js:"alert('error');"}
        end
      end
    end


end
