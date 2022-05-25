# Carts are a joining table between Profiles and Coffees, and are how I am approximating a purchase within the app.
# When a coffee is added to a cart, the coffee[:quantity] should be reduced by the value of cart[:quantity] (removing
# that many coffees from circulation). 'Purchasing' should destroy cart/s associate with the user's profile
class CartsController < ApplicationController
  before_action :set_profile, only: [:index, :new, :create, :checkout]
  before_action :set_coffee, only: [:create]
  before_action :set_cart, only: [:increase, :decrease, :remove, :destroy]

  def index
    @carts = Cart.where("profile_id = #{@profile.id}")
  end

  # Due to implementation(no forms, "Add to Cart" button), Cart creation requires special attention. This method creates
  # a new Cart, and assigns it's attibrutes afterwards to associate it with the correct profile and coffee
  def create
    @cart = Cart.new
    @cart.profile = @profile
    @cart.coffee = @coffee
    @cart.quantity = 1
    @cart.coffee.quantity -= 1

    if @cart.save && @cart.coffee.save
      redirect_to root_path
      flash[:notice] = 'Added to cart'
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_to root_path
    end
  end

  def increase
    @cart.quantity += 1
    @cart.coffee.quantity -= 1
    if @cart.save && @cart.coffee.save
      redirect_to carts_path
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_back
    end
  end

  def decrease
    @cart.quantity -= 1
    @cart.coffee.quantity += 1
    if @cart.save && @cart.coffee.save
      redirect_to carts_path
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_back
    end
  end

  def remove
    @cart.coffee.quantity += @cart.quantity
    if @cart.coffee.save
      @cart.destroy
      redirect_to carts_path
      flash[:notice] = 'Item Removed'
    else
      flash[:alert] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_back
    end
  end

  def destroy
  end

  # Payment has not been implemented. This method mimics purchasing all items by destroying all Carts associated with a user's profile, without 'refunding' the coffee quantities back to their inventories
  def checkout
    @carts = Cart.where("profile_id = #{@profile.id}")
    @carts.each do |cart|
      cart.destroy
    end
    flash[:notice] = 'Purchase Successful'
    redirect_to carts_path

  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    return params.require(:cart).permit(:id, coffee_attributes: [:id])
  end
end
