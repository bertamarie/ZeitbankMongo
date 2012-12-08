class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @projects = Project.where('fans.user_id' => @user.id.to_s)
  end
end
