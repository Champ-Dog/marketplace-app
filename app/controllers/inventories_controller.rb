class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_profile, only: [:show]
  before_action :set_inventory

  def show
    @inventory = current_user.profile.inventory
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def check_auth
    authorize Inventory
  end
end
