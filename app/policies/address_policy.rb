class AddressPolicy < ApplicationPolicy
  def show?
    owner?
  end

  def create?
    return true if user.present?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    return true if user.present? && user.profile == record.profile
  end


  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
