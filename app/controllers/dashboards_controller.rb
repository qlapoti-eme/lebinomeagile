class DashboardsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    # @proposals = policy_scope(Proposal).order(created_at: :desc)
    @bookings = current_user.bookings
    @proposals = current_user.proposals
  end
end
