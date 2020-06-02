class ProposalsController < ApplicationController
  before_action :find_proposal, only: [:destroy, :update, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @booking = Booking.new
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
      create_slots(@proposal)
      redirect_to dashboards_path
    else
      render 'new'
    end
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
    params.require(:proposal).permit(:name, :description, :end_time, :dates, :start_slot, :end_slot)
  end
  
  def find_proposal
    @proposal = Proposal.find(params[:id])
  end
  
  def create_slots(proposal)
    # recup les dates sous forme de string
    all_dates = proposal_params[:dates].split(',')
    sslot = proposal_params[:start_slot].split(':').first.to_i
    eslot = proposal_params[:end_slot].split(':').first.to_i
    range_slot = (sslot..eslot-1  )
    all_dates.each do |date|
        range_slot.each do |slot| 
          Slot.create!(start_time: DateTime.parse("#{date} #{slot}"), proposal: proposal)
        end
    end
  end
end
