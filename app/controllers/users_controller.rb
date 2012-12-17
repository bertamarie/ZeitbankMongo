class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favourite_projects = Project.where('fans.user_id' => @user.id.to_s)
    @owned_projects = Project.where('owner' => @user.id.to_s)
    @supported_projects = Project.where('supporter' => @user.id.to_s)
  end
end
