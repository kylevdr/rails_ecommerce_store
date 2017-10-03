class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    unless logged_in?
      store_location
      flash[:error] = "You must log in first."
      redirect_to login_url
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:error] = "You must be an admin to do that."
      redirect_to root_url
    end
  end
end
