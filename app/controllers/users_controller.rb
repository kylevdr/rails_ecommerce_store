class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Create new order
    # Create new cart
    if @user.save
      # @order.save
      # @cart.save
      flash[:success] = 'User successfully created.'
      redirect_to root_path
    else
      render new
    end
  end

  private

  def user_params
    params[:admin] = false
    params.require(:user).permit(:email, :password, :admin)
  end
end
