class CartPolicy < ApplicationPolicy
  def new?
    customer?
  end

  def show?
    customer?
  end

  def create?
    customer?
  end

#   def update?
#     owner?
#   end

#   def destroy?
#     owner?
#   end

  private

  def customer?
    return true if user.present? && user.profile.has_role?(:customer)
  end


  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
