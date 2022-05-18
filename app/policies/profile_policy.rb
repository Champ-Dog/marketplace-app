class ProfilePolicy < ApplicationPolicy
  def show?
    return true if user.present? && user == record.user
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == record.user
  end
end
