class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

  def index
    users = User.all
    render json: users
  end

  # def create
  #   user = User.create(user_params)
  #   render json: {
  #     id: user.id,
  #     username: user.username,
  #     jwt: JWT.encode({id: user.id}, "LIFEsTRIFE", false)
  #   }
  # end

  def create
    user = User.create(user_params)
    if user && !user.errors.any?
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { jwt: token, user: { id: user.id, email: user.email } }
    else
      error = user.errors.any? ? user.errors.full_messages : "Signup failed!"
      render json: { error: error }, status: :unauthorized
    end
  end


  def show
    render json: current_user
  end


  def update
    user = User.find_by(id: params[:id])
    user.update(user_params)
    render json: user
  end


  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
