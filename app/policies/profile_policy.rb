class ProfilePolicy < ApplicationPolicy

  def show?
    owner?
  end

  def create?
    user.present?
  end

  def update?
    owner?
  end

  private

  def owner?
    return true if user.present? && user == record.user
  end

end