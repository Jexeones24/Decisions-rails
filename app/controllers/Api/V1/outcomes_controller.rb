class Api::V1::OutcomesController < ApplicationController
 # before_action :authorized

  def index
    outcomes = Outcome.all
    render json: outcomes
  end

  def create
    outcome = Outcome.create(outcome_params)
    decision = Decision.find_by(id: params[:decision_id])
    decision.outcomes << outcome
    render json: outcome
  end

  def show
    outcome = Outcome.find_by(id: params[:id])
    render json: outcome
  end

  def update
    outcome = Outcome.find_by(id: params[:id])
    outcome.update(outcome_params)
    render json: outcome
  end

  def destroy
    outcome = Outcome.find_by(id: params[:id])
    outcome.destroy
    outcomes = Outcome.all
    render json: outcomes
  end

  private

  def outcome_params
    params.require(:outcome).permit(:content, :decision_id)
  end
end
