class CartsController < ApplicationController
  before_action :require_login
  def show
    @cart = current_user.cart
  end
end
