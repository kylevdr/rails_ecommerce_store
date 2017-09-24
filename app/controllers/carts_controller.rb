class CartsController < ApplicationController
  # before action - check if logged in and redirect if not
  def show
    @cart = current_user.cart
  end
end
