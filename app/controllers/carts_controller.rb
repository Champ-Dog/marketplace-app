# Carts are a joining table between Profiles and Coffees, and are how I am approximating a purchase within the app.
# When a coffee is added to a cart, the coffee[:quantity] should be reduced by the value of cart[:quantity] (removing
# that many coffees from circulation). 'Purchasing' should destroy cart/s associate with the user's profile
class CartsController < ApplicationController
  before_action :set_profile, only: [:index, :new, :create, :cart_total]
  before_action :set_coffee, only: [:create]
  before_action :set_cart, only: [:increase, :decrease, :destroy]

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

    if @cart.save
      redirect_to root_path
      flash[:notice] = 'Added to cart'
    else
      flash[:notice] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_to root_path
    end
  end

  def increase
    @cart.quantity += 1
    @cart.coffee.quantity -= 1
    if @cart.save && @cart.coffee.save
      redirect_to carts_path
    else
      flash[:notice] = @cart.errors.full_messages.join('<br />').html_safe
      redirect_to carts_path
    end
  #   @cart.coffee.quantity += 1
  #   redirect_to carts_path
  end
  # def update
  #   begin
  #     @cart.update!(cart_params)
  #     redirect_to carts_path
  #   rescue StandardError => e
  #     flash[:alert] = e
  #     redirect_to carts_path
  #   end
  # end

  def destroy
    @cart.destroy
    redirect_to carts_path
    flash[:notice] = 'Item Removed'
  end

  def self.cart_total
    @carts = Cart.where("profile_id = #{@profile.id}")
    total = 0
    @carts.each do |cart|
      total += (cart.quantity * cart.coffee.price)
    end
    return total
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
