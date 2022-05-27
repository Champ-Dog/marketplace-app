class AddressPolicy < ApplicationPolicy
  def show?
    return user.present?
  end

  def create?
    return user.present?
  end

  def update?
    return user.present?
  end

  def destroy?
    return user.present?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(profile_id: @user.profile[:id])
    end
  end
end
