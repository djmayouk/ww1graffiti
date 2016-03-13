class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  private

    # Confirm the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # not used, untested
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
