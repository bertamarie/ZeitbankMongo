class FansController < ApplicationController
  before_filter :authenticate_user!
    
  # GET /fans
  # GET /fans.json
  def index
    @fans = Fan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fans }
    end
  end

  # GET /fans/1
  # GET /fans/1.json
  def show
    @fan = Fan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fan }
    end
  end

  # GET /fans/new
  # GET /fans/new.json
  def new
    @fan = Fan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fan }
    end
  end

  # GET /fans/1/edit
  def edit
    @fan = Fan.find(params[:id])
  end

  # POST /fans
  # POST /fans.json
  
  def create  
     project = Project.find(params[:project])
     user = User.find(params[:user])
     @fan = Fan.new(user_id: user.id)
     @fan.project = project
     project.update_attribute("likes", project.likes + 1)

    respond_to do |format|
      if @fan.save!
        format.html { redirect_to home_url notice: 'Fan was successfully created.' }
        format.js
        format.json { render json: @fan, status: :created, location: @fan }
      else
        format.html { render action: "new" }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fans/1
  # PUT /fans/1.json
  def update
    @fan = Fan.find(params[:id])
    respond_to do |format|
      if @fan.update_attributes(params[:fan])
        format.html { redirect_to @fan, notice: 'Fan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fans/1
  # DELETE /fans/1.json
  def destroy
    project = Project.find(params[:id])
    fan = project.fans.where(user_id: current_user.id).first
    project.fans.delete(fan)
    project.update_attribute("likes", project.likes - 1)

    respond_to do |format|
     format.html { redirect_to home_url, notice: 'Fan was successfully deleted.' }
     format.json { head :no_content }
    end
  end
end
