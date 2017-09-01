class Api::V1::DecisionsController < ApplicationController

  def index
    decisions = Decision.all
    render json: decisions
  end

  def create
    decision = Decision.create(decision_params)
    current_user.decisions << decision
    render json: decision
  end

  def show
    decision = Decision.find_by(id: params[:id])
    render json: decision
  end

  def update
    decision = Decision.find_by(id: params[:id])
    decision.update(decision_params)
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
