class BookingsController < ApplicationController
  # index.html.erb
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end
  
  def new
    @booking = Booking.new
    authorize @booking
    @proposal = Proposal.find(params[:proposal_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booker = current_user
    # @booking.proposal = Proposal.find(params[:proposal_id])
    authorize @booking
    if @booking.save
      flash[:notice] = "Booking done !"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:reservation_status, :url_room, :chatroom, :user, :proposal_id)
  end
end
