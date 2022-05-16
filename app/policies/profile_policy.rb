class ProfilePolicy < ApplicationPolicy
  def index?
    return true if user.present? && current_user.profile == profile
  end

  def show?
    return true if user.present? && user == profile.user
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == profile.user
  end

  def destroy?
    return true if user.present? && user == profile.user
  end

  private

  def profile
    record
  end
end