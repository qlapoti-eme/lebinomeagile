class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def update?
    record.proposer == user
    # - record: the instance (proposal) passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    return true
    # record.proposer == user
  end
end
