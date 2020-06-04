class BookingsController < ApplicationController
  # index.html.erb
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @proposal = Proposal.find(params[:proposal_id])
    @slots = @proposal.slots
  end

  def create
    @booking = Booking.new
    @booking.booker = current_user
    @booking.proposal = Proposal.find(params[:proposal_id])
    @booking.start_time = params[:booking][:start_time]
    authorize @booking
    if @booking.save!
      flash[:notice] = "Booking done !"
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @token = generate_token(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboards_path
  end

  private



  def generate_token(booking)
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new ENV['ACCOUNT_SID'], ENV['KEY_ID'], ENV['AUTH_TOKEN'], [],
        ttl: 14400,
        identity: current_user.email
    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = booking.url_room
    token.add_grant grant
    # Serialize the token as a JWT
    token.to_jwt
  end

end
