class IdentifiedUsersController < ApplicationController
  before_action :authenticate
  before_action :set_project

  def index
    @identified_users = @project.identified_users
  end

  def show
    @identified_user = @project.identified_users.find(params[:id])
    @logs = @identified_user.logs
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end