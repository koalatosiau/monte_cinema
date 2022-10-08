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

  def confirm?
    user&.admin? && record.pending?
  end

  def cancel?
    (record.email == user&.email || user&.admin?) && !record.cancelled?
  end
end
