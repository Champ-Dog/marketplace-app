class InventoriesController < ApplicationController
#   before_action :authenticate_user!
  before_action :set_profile, only: [:show]
  before_action :set_inventory

  def show
    # I need to change this so customers can view an inventory
    # Or do I? I could do it under 'coffee#index' or similar somehow if I implement search?
    @inventory = current_user.profile.inventory
  end

#   def new
#     @inventory = @profile.build_inventory
#   end

#   def create
#     @inventory = @profile.build_inventory

#     if @inventory.save
#       redirect_to @profile
#       flash[:notice] = 'Merchant account configured'
#     else
#       flash.now[:notice] = @inventory.errors.full_messages.join('<br />').html_safe
#       redirect_to @profile
#     end
#   end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
