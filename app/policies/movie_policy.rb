class  MoviePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user&.admin?
  end

  def create?
    new?
  end

  def show?
    index?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end
end
