class CoffeePolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
   merchant?
  end

  def update?
    merchant?
  end

  def destroy?
    merchant?
  end

  private

  def merchant?
    user.profile.has_role? :merchant
  end

  def owner?
    return user.present? && merchant? && user.profile.inventory == record.inventory
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(inventory_id: @user.profile.inventory[:id])
    end
  end
end
