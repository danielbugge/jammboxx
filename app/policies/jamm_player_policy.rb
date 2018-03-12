class JammPlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
    # record.user == user
  end

  def destroy?
    true
    # record.user == user
  end
end
