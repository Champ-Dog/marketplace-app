# Carts should only be visible and interactable for the owner of the profile to which they are associated
class CartPolicy < ApplicationPolicy
  # Index calls 'set_profile' which is based on the current user's profile, so it shouldn't be possible to see another
  # user's carts. It should only be necessary to check that the user's profile has the customer role
  def index?
    customer?
  end
  
  def new?
    customer?
  end

  def create?
    customer?
  end

  def increase?
    customer?
  end

  def decrease?
    customer?
  end

  def remove?
    customer?
  end

  def destroy?
    customer?
  end

  def checkout?
    customer?
  end

  private

  def owner?
    return user.present? && user.profile == record.profile
  end
  
  def customer?
    return user.present? && user.profile.has_role?(:customer)
  end


  class Scope < Scope
    attr_reader :user, :scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(profile_id: @user.profile[:id])
    end
  end
end
