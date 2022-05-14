class AddressesController < ApplicationController
  before_action :get_profile
  before_action :set_address, only: [:show, :edit, :update, :destroy]


  def index
    @addresses = @profile.addresses
  end

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
    else
      flash.alert = @address.errors.full_messages.join('<br />')
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @address.update!(address_params)
      redirect_to @profile
      flash.notice = 'Details Updated!'
    rescue
      flash.alert = @address.errors.full_messages.join('<br />').html_safe
      render 'edit' 
    end
  end

  def destroy
    @address.destroy
    redirect_to @profile
    flash.notice = 'Address Removed'
  end

  private

  def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_address
    @address = @profile.addresses.find(params[:id])
  end

  def address_params
    return params.require(:address).permit(:profile_id, :street_number, :street_name, :suburb, :postcode, :state)
  end
end