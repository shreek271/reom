class ProjectsController < ApplicationController

  before_action :set_project, only: [:update, :show, :destroy]

  def index
    @projects = Project.all
    json_response(@projects)
  end

  def create
  	@project = Project.create!(project_params)
  	json_response(@project, :created)
  end

  def show
  	json_response(@project)
  end

  def update
  	@project.update(project_params)
    head :no_content
  end

  def destroy
    @project.destroy
  end

  private

  def set_project
  	@project = Project.find(params[:id] || params[:project_id])
  end

  def project_params
  	params.require(:project).permit(:name, :description, :estimate, :status)
  end
end