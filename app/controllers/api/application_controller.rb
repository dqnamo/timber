class Api::ApplicationController < ActionController::API
  before_action :authenticate

  def identified_user
    return nil unless params[:user_id]

    IdentifiedUser.find_or_create_by(
      project: @project,
      external_id: params[:user_id]
    )
  end

  private

  def authenticate
    # Find project by bearer token
    bearer_token = request.headers["HTTP_AUTHORIZATION"]
    bearer_token = bearer_token.split.last if bearer_token

    if project = Project.find_by(api_key: bearer_token)
      @project = project
    else
      render_unauthorized
    end
  end

  def render_unauthorized
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end