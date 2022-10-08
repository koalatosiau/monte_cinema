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

  def show?
    user&.admin?
  end

  def edit?
    (record.email == user&.email || user&.admin?) && record.pending?
  end

  def update?
    edit?
  end

  def confirm?
    show? && record.pending?
  end

  def cancel?
    edit? && !record.cancelled?
  end
end
