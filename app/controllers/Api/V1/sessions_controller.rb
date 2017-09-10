class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]


  def show
    render json: {
      id: current_user.id,
      username: current_user.username
    }
  end

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        payload = {user_id: user.id}
        token = issue_token(payload)
        render json: { jwt: token, user: { id: user.id, email: user.email } }
      else
        error = user.errors.any? ? user.errors.full_messages : "Login failed!"
        render json: { error: error }, status: :unauthorized
      end
    end
  end

end
