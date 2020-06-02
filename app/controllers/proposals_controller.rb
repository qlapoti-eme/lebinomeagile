class ProposalsController < ApplicationController
  before_action :find_proposal, only: [:destroy, :update, :show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @booking=Booking.new
    @proposals = policy_scope(Proposal).order(created_at: :desc)
    if params[:cat]
      @proposals = @proposals.select { |proposal| proposal.primary_category.id == params[:cat].to_i }
    end
    @categories = PrimaryCategory.all
  end

  def show
  end

  def new
    @proposal = Proposal.new
    @categories = PrimaryCategory.all
    authorize @proposal
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.secondary_category = SecondaryCategory.find(params[:proposal][:secondary_category])
    @proposal.proposer = current_user
    authorize @proposal
    if @proposal.save!
      redirect_to dashboards_path
    else
      render 'new'
    end
  end

  def edit
    authorize @proposal
  end

  def update
    authorize @proposal
    if @proposal.update(proposal_params)
      redirect_to root_path
    else
      redirect_to dashboards_path
    end

  end

  def destroy
    authorize @proposal
    @proposal.destroy
    redirect_to dashboards_path
  end


private

  def proposal_params
    params.require(:proposal).permit(:name, :description, :start_time, :end_time)
  end

  def find_proposal
     @proposal = Proposal.find(params[:id])
  end


end
