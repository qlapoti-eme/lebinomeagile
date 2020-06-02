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
    @booking = Booking.new
    @booking.booker = current_user
    @booking.proposal = Proposal.find(params[:proposal_id])
    authorize @booking
    if @booking.save!
      flash[:notice] = "Booking done !"
      create_room(@booking)
      redirect_to dashboards_path
    else
      render :new
    end
  end

<<<<<<< HEAD
  private

  def create_room(booking)
    # 
    # Your Account Sid and Auth Token from twilio.com/console
    # DANGER! This is insecure. See http://twil.io/secure
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    # Download the helper library from https://www.twilio.com/docs/ruby/install

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    room = @client.video.rooms.create(unique_name: 'DailyStandup')

    puts room
=======
  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboards_path
>>>>>>> master
  end

end
