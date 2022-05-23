class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_profile, only: [:show, :new, :create, :update, :destroy]
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  

  # after_action :verify_authorized

  def show
    redirect_to @profile
  end

  def new
    @address = @profile.addresses.build
  end

  def create
    @address = @profile.addresses.build(address_params)

    if @address.save
      redirect_to @profile
      flash[:notice] = 'Address added'
    else
      flash.now[:notice] = @address.errors.full_messages.join('<br />').html_safe
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @address.update!(address_params)
      redirect_to @profile
    rescue StandardError => e
      flash[:alert] = e.join('<br>').html_safe
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to @profile
    flash[:notice] = 'Address Removed'
  end

  private

  def check_auth
    authorize Address
  end

  def set_profile
    @profile = current_user.profile
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    return params.require(:address).permit(:street_number, :street_name, :suburb, :postcode, :state)
  end
end
