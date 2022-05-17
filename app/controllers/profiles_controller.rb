class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_profile, only: [:show, :update, :edit, :destroy]

  def index
    @profiles = Profile.all
    # authorize @profiles
  end

  def show
    # @profile = @user.profile.includes(:addresses).find(params[:id])
  end

  def new
    @profile = @user.profile.build
    authorize @profile
  end

  def create
    @profile = @user.profile.build.create(profile_params)
    @profile.user = current_user
    authorize @profile

    if @profile.save
      redirect_to @profile
      flash.notice = 'Profile Created'
    else
      flash.alert = @profile.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @profile.update!(profile_params)
      flash.notice = 'Details Updated!'
      redirect_to @profile
    else
      render 'edit'
      flash.alert = @profile.errors.full_messages
    end
  end

  def destroy
    @profile.profile_picture.purge
    @profile.destroy
  end

  private

  def get_user
    @user = current_user
  end

  def set_profile
    @profile = @user.profile
    authorize @profile
  end

  # Used to handle and sanitise parameters to make new profiles
  def profile_params
    return params.require(:profile).permit(:user_id, :username, :name, :contact_number, :profile_picture, address_attributes: [:street_number, :street_name, :suburb, :postcode, :state])
  end
end
