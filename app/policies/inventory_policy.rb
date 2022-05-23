class InventoryPolicy < ApplicationPolicy
  def create?
    merchant?
  end

  def show?
    merchant?
  end

  private

  def merchant?
    user.profile.has_role? :merchant
  end
end
