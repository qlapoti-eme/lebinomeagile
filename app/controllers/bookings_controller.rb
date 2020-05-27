class BookingsController < ApplicationController
  # index.html.erb
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end
  
  def new
    @proposal = Proposal.find(params[:proposal_id])
    @booking = Booking.new
  end

  def create
    authorize @booking
    @proposal = Proposal.new(booking_params)
    @booking.user = current_user
    @booking.proposal = Proposal.find(params[:proposal_id])
    if @booking.save
      flash[:notice] = "Booking done !"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:reservation_status, :url_room, :chatroom, :user, :proposal)
  end
end
