# Carts are a joining table between Profiles and Coffees, and serve two main roles:
# 1 - Simulating a typical 'shopping cart' from an online store, by providing a collection of all Cart records
# associated with their profile
# 2 - Simulating purchases within the app
# A user viewing their cart is actually seeing a collection of individual Cart records associated with their profile
class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_profile, only: %i[index new create checkout]
  before_action :set_coffee, only: [:create]
  before_action :set_cart, only: %i[increase decrease remove destroy]

  # Users should only see carts belonging to them
  def index
    @carts = Cart.where("profile_id = #{@profile.id}")
  end

  # Due to implementation (no forms, "Add to Cart" button), Cart creation requires special attention. This method
  # creates a new Cart, and assigns it's attibrutes afterwards to associate it with the correct profile and coffee
  # Creating also adjusts the available quantity of the appropriate Coffee. Calling 'increase' would be the preferred
  # solution, but it will not recognise a valid Cart object if called within this method. However this should not be
  # an issue, as the 'add to cart' button shouldn't be displayed unless there is at least 1 coffee available
  def create
    @cart = Cart.new
    @cart.profile = @profile
    @cart.coffee = @coffee
    @cart.quantity = 1
    @cart.coffee.quantity -= 1

    save?
  end

  # Checks that sufficient quantity of coffee exists before increasing cart quantity
  def stock?
    @cart.coffee.quantity.positive?
  end

  # Checks that Cart and Coffee have successfully saved their new values before finishing increase/decrease method
  def save?
    if @cart.save && @cart.coffee.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
      return
    end
  end

  # Check to prevents users from removing the last coffee from a Cart; to prevent a '0' quantity
  def not_last?
    @cart.quantity > 1
  end

  # Increase and Decrease are custom methods allowing users to add or remove items from their cart, and adjusting the
  # quantity of the involved coffee accordingly
  def increase
    if stock?
      @cart.quantity += 1
      @cart.coffee.quantity -= 1
    else
      flash[:alert] = "No more of this coffee is available"
    end

    save?
  end

  def decrease
    if not_last?
      @cart.quantity -= 1
      @cart.coffee.quantity += 1
    else
      flash[:alert] = "Can't decrease last item, please select Remove"
    end

    save?
  end

  # This is a custom method to delete a specific Cart record. To a user, this should appear to be removing a specific
  # item from their Cart. This method needs to "refund" the available quantity of the appropriate coffee, which
  # behaviour is NOT desired in the "Checkout" method that uses 'destroy'. To allow both of these methods to function
  # as intended, custom methods have been provided for both
  def remove
    @cart.coffee.quantity += @cart.quantity
    if @cart.coffee.save
      @cart.destroy
      redirect_to carts_path
      flash[:notice] = 'Item Removed'
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
    end
  end

  # Payment has not been implemented. This method mimics purchasing all items by destroying all Carts associated with a
  # user's profile, without 'refunding' the coffee quantities back to their inventories
  def checkout
    @carts = Cart.where("profile_id = #{@profile.id}")
    @carts.each do |cart|
      cart.destroy
    end
    flash[:notice] = 'Purchase Successful'
    redirect_to carts_path
  end

  private

  def check_auth
    authorize Cart
  end

  def set_profile
    @profile = current_user.profile
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def set_cart
    @cart = policy_scope(Cart).find(params[:id])
  end

  def cart_params
    return params.require(:cart).permit(:id, coffee_attributes: [:id])
  end
end
