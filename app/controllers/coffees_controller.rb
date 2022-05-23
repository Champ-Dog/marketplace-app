class CoffeesController < ApplicationController
  before_action :set_coffee, only: [:show, :edit, :update, :destroy]
  before_action :check_auth
  before_action :authenticate_user!, except: [:index]
  before_action :set_inventory, only: [:new, :create, :update, :destroy]

  def new
    @coffee = @inventory.coffees.build
  end

  def create
    @coffee = @inventory.coffees.build(coffee_params)

    if @coffee.save
      redirect_to @inventory
      flash[:notice] = 'Coffee added'
    else
      flash.now[:notice] = @coffee.errors.full_messages.join('<br />').html_safe
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @coffee.update!(coffee_params)
      redirect_to @inventory
    rescue StandardError => e
      flash[:alert] = e
      render 'edit'
    end
  end

  def destroy
    @coffee.destroy
    redirect_to @inventory
    flash[:notice] = 'Coffee Removed'
  end 

  private

  def set_inventory
    @inventory = current_user.profile.inventory
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def check_auth
    authorize @coffee
  end

  def coffee_params
    return params.require(:coffee).permit(:id, :name, :origin, :description, :price, :roast_type, :coffee_image)
  end
end
