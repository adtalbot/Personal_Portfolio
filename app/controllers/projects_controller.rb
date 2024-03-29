class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :index
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  def new
    @project = Project.new
    render :new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to projects_path
      else
        render :new
      end
    end
    private
    def project_params
      params.require(:project).permit(:name)
  end
end
