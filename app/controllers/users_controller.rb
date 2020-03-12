class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def update
    @user = User.find_by(id: current_user.id)
    @user.update(user_params)
    flash.notice = "User has been updated"
    redirect_to user_path
  end

  def show
    @user = User.find(current_user.id)
    @attending_events = current_user.attending
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.permit(:name)
  end
end
