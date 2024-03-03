class EventsController < ApplicationController
  before_action :authenticate
  before_action :set_project

  def index
    @events = @project.events
    @logs = @project.logs.order(public_created_at: :desc)
  end

  def show
    @event = @project.events.find(params[:id])
    @logs = @event.logs
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end

