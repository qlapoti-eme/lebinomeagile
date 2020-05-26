class ProposalsController < ApplicationController
  before_action :find_proposal, only: [:destroy, :update, :show]

  def index
    @proposals = Proposal.all
  end

  def show
  end

  def new
    @proposal = Proposal.new
  end

  def create
    authorize @proposal
    @proposal = Proposal.new(proposal_params)
    if @proposal.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def destroy
     @proposal.destroy
     redirect_to proposals_path
  end


private

  def proposal_params
    params.require(:proposal).permit(:name, :description, :start_time, :end_time)
  end

  def find_proposal
     @proposal = Proposal.find(params[:id])
  end


end
