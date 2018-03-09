class JammPlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
  end

  def create?

  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
