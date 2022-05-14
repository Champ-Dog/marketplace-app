class AddressesController < ApplicationController
<<<<<<< HEAD
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
=======
  before_action :set_address, only: [:show, :update, :edit, :destroy]

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
>>>>>>> 7a3b07e (Address model created)
  end

  def edit
  end

  def update
<<<<<<< HEAD
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
=======
    @address.update!(address_params)
>>>>>>> 7a3b07e (Address model created)
  end

  private

<<<<<<< HEAD
  def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_address
    @address = @profile.addresses.find(params[:id])
  end

  def address_params
    return params.require(:address).permit(:profile_id, :street_number, :street_name, :suburb, :postcode, :state)
=======
  def set_address
    @address = Address.find(params[:id])
  end

#   Used to handle and sanitise parameters to make new profiles
  def profile_params
    return params.require(:address).permit(:username, :name, :contact_number)
>>>>>>> 7a3b07e (Address model created)
  end
end
