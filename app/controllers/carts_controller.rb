# Carts are a joining table between Profiles and Coffees, and are how I am approximating a purchase within the app.
# When a coffee is added to a cart, the coffee[:quantity] should be reduced by the value of cart[:quantity] (removing
# that many coffees from circulation). 'Purchasing' should destroy cart/s associate with the user's profile
class CartsController < ApplicationController
  before_action :set_profile, only: [:new, :create]
  before_action :set_coffee, only: [:create]

  # def new
  #   @cart = Cart.new
  # end

  def create
    @cart = Cart.new
    @cart.profile = @profile
    @cart.coffee = @coffee
    @cart.quantity = 1

    # @cart = @profile.carts.build(cart_params)

    if @cart.save
      redirect_to root_path
      flash[:notice] = 'Added to cart'
    else
      flash[:notice] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_to root_path
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def cart_params
    return params.require(:cart).permit(coffee_attributes: [:id])
  end
end
