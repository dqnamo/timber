class Api::EventsController < Api::ApplicationController

  def log
    if params[:name].blank?
      render json: { error: "name is required" }, status: :bad_request
      return
    end
    
    @event = @project.events.find_by(name: params[:name])
    @event = @project.events.create(name: params[:name], icon: params[:icon] || "📝") if @event.nil?

    @event.logs.create(
      message: params[:message],
      identified_user: identified_user,
      metadata: params[:metadata] || {}
    ) 

    render json: { success: true }
  end

end