class UsersController < ApplicationController
  # before_action :require_complete_profile
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  def show
    @users = User.all
    @user = User.find(params[:id])

    @users.each do |user|
      if user.id == @user.id
        @profile = user
      end
    end
  end


  private

  # def require_complete_profile
  #   user = User.find_by(id: params[:id])
  #   unless user && user.profile_completed?
  #     redirect_to edit_user_registration_path(user, name: current_user.name), alert: "Please complete your profile first you are not be able to redirect any other page."
  #   end
  # end
end
