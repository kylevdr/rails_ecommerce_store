class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    order = Order.new(user: @user, status: 'IN_PROGRESS')
    cart = CurrentOrder.new(user: @user, order: order)
    # Create new order
    # Create new cart
    if @user.save
      order.save
      cart.save
      log_in @user
      flash[:success] = 'Account successfully created.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
