class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :edit, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.includes(:addresses).find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    flash.notice = 'Profile Created'

    redirect_to @profile
  end

  def edit
  end

  def update
    @profile.update!(profile_params)
    flash.notice = 'Details Updated!'

    redirect_to @profile
  end

  def destroy
    @profile.profile_picture.purge
    @profile.destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_addresses
    @addresses = Address.order(:last_name)
  end

#   Used to handle and sanitise parameters to make new profiles
  def profile_params
    return params.require(:profile).permit(:username, :name, :contact_number, :profile_picture, address_attributes: [:street_number, :street_name, :suburb, :postcode, :state])
  end
end
