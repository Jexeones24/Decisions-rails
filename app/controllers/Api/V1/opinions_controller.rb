class Api::V1::OpinionsController < ApplicationController
  # before_action :authorized

  def index
    opinions = Opinion.all
    render json: opinions
  end

  def create
    opinion = Opinion.create(opinion_params)
    outcome = Outcome.find_by(id: params[:outcome_id])
    outcome.opinions << opinion
    render json: opinion
  end

  def show
    opinion = Opinion.find_by(id: params[:id])
    render json: opinion
  end

  def update
    opinion = Opinion.find_by(id: params[:id])
    opinion.update(opinion_params)
    render json: opinion
  end

  def destroy
    opinion = Opinion.find_by(id: params[:id])
    opinion.destroy
    opinions = Opinion.all
    render json: opinions
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content, :outcome_id, :value)
  end
end
