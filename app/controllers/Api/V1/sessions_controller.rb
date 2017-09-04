class Api::V1::SessionsController < ApplicationController
  before_action :authorize_user!, only: [:show]

  def show
    render json: {
      id: current_user.id,
      username: current_user.username
    }
  end

  def create
    # byebug
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({id: user.id}, "LIFEsTRIFE")
      }
    else
      render json: {
        error: "You do not have the correct credentials."
      }, status: 404
    end
  end

end
