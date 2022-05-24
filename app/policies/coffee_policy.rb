class CoffeePolicy < ApplicationPolicy
  def create?
   merchant?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def merchant?
    user.profile.has_role? :merchant
  end

  def owner?
    return true if user.present? && merchant? && user.profile.inventory == record.inventory
  end


  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
