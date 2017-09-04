class Api::V1::DecisionsController < ApplicationController

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


  # opinions is actually same as outcomes
  def show
    # byebug
    decision = Decision.find_by(id: params[:id])
    outcomes = decision.outcomes
    opinions = decision.outcome_opinions(outcomes)
    render json: {
      decision: decision,
      outcomes: outcomes,
      opinions: opinions
    }

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
