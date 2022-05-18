class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:new, :show, :update, :edit, :destroy]
  before_action :check_auth

  after_action :verify_authorized

  def show
    # @profile = @user.profile.includes(:addresses).find(params[:id])
  end

  def new
    @profile.build
  end

  def create
    @profile.build.create(profile_params)

    if @profile.save
      redirect_to @profile
      flash[:notice] = 'Profile Created'
    else
      flash[:alert] = @profile.errors.full_messages
    end
  end

  def edit
  end

  def update
    begin
     @profile.update!(profile_params)
      flash[:notice] = 'Details Updated!'
      redirect_to @profile
    rescue
      flash[:alert] = @profile.errors.full_messages.join('<br>').html_safe
      render 'edit'
    end
  end

  def destroy
    @profile.profile_picture.purge
    @profile.destroy
  end

  private

  def check_auth
    authorize @profile
  end

  def set_profile
    @profile = current_user.profile
  end

  # Used to handle and sanitise parameters to make new profiles
  def profile_params
    return params.require(:profile).permit(:user_id, :username, :name, :contact_number, :profile_picture, address_attributes: [:street_number, :street_name, :suburb, :postcode, :state])
  end
end
