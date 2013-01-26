class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def messages
    @user = User.find(params[:id])
    @messages_received = Message.where('recipient' => @user.id.to_s)
    @messages_sent = Message.where('sender' => @user.id.to_s)
    respond_to do |format|
        format.html
        format.json { head :no_content }
    end
  end
  
  def show
    @user = User.find(params[:id])
    @favourite_projects = Project.where('fans' => @user.id.to_s).page(params[:page]).per(4)
    @owned_projects = Project.where('owner' => @user.id.to_s).page(params[:page]).per(4)
    @supported_projects = Project.where('supporter' => @user.id.to_s).page(params[:page]).per(4)
    
    @supported_projects.each do |project|
      @tasks = (project.tasks.where('owner' => @user.id.to_s))
    end
    respond_to do |format|
       format.html # show.html.erb
       format.js
    end
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
