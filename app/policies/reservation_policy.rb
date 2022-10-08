class  ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      elsif user
        scope.where(email: user.email)
      end
    end
  end

  def index?
    user
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    user&.admin?
  end

  def edit?
    record.email == user&.email || user&.admin?
  end

  def update?
    edit?
  end
end
