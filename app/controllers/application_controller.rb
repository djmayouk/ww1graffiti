class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  helper_method :current_user

  private

    # Confirm user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to '/auth/facebook'
      end
    end

    # Confirm user is an administrator
    def admin_user
      unless current_user.admin?
        flash[:danger] = "You are not authorised."
        redirect_to '/'
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
