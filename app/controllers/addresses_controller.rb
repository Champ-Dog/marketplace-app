class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    flash.notice = 'Address Added'

    redirect_to profiles_path
  end

  def edit
  end

  def update
    @address.update!(address_params)
    flash.notice = 'Details Updated!'
  end

  private

  def address_params
    return params.require(:address).permit(:profile_id, :street_number, :street_name, :suburb, :postcode, :state)
  end
end
