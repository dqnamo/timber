class LogsController < ApplicationController
  before_action :authenticate
  before_action :set_project
  before_action :set_event

  def show
    @log = @event.logs.find(params[:id])
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_event
    @event = @project.events.find(params[:event_id])
  end
end

