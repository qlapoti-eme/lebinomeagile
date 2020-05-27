class DashboardsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    # @bookings = Bookings.all
    # @proposals = current_user.proposals
  end
end
