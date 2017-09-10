class Api::V1::DecisionsController < ApplicationController
  before_action :authorized

  def index
    decisions = Decision.all
    render json: decisions
  end

  def create
    decision = Decision.create(decision_params)
    user = User.find_by(id: params[:user_id])
    user.decisions << decision
    render json: decision
  end


  def show
    decision = Decision.find_by(id: params[:id])
    render json: decision
  end

  def update
    # byebug
    decision = Decision.find_by(id: params[:id])
    decision.update(content: params[:content])
    render json: decision
  end

  def destroy
    decision = Decision.find_by(id: params[:id])
    decision.destroy
    decisions = Decision.all
    render json: decisions
  end

  private

  def decision_params
    params.require(:decision).permit(:content, :user_id)
  end
end
