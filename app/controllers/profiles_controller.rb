class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  before_action :check_auth

  after_action :verify_authorized

  def show
  end

  def new
    @profile.build
  end

  def create
    @profile.build.create(profile_params)

    if @profile.save
      redirect_to @profile
    else
      flash[:alert] = @profile.errors.full_messages
    end
  end

  # Adds merchant role to profile and creates inventory
  def merchant
    @profile.add_role :merchant
    @profile.create_inventory!
    redirect_to @profile
  end

  # Adds customer roles to profile
  def customer
    @profile.add_role :customer
    redirect_to @profile
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

  def profile_params
    return params.require(:profile).permit(:user_id, :roles, :username, :name, :contact_number, :profile_picture)
  end
end
