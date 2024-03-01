class Api::IdentifiedUsersController < Api::ApplicationController
  def identify
    return if identified_user.nil?

    identified_user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email]
    )

    render json: { success: true }
  end
end

