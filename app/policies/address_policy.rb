class AddressPolicy < ApplicationPolicy
  def show?
    return true if user.present? && user.profile == record.profile
  end

  def create?
    return true if user.present?
  end

  def update?
    return true if user.present? && user.profile == record.profile
  end

  def destroy?
    return true if user.present? && user.profile == record.profile
  end


  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
