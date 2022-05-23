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

  def merchant?
    owner? && (record.has_any_role? :merchant, :customer) == false
  end

  def customer?
    owner? && (record.has_any_role? :merchant, :customer) == false
  end

  private

  def owner?
    return true if user.present? && user == record.user
  end
end
