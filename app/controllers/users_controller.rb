class UsersController < ApplicationController
  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    flash.notice = "User has been updated"
    redirect_to users_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
