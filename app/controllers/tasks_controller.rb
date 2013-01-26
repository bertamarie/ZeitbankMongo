class TasksController < ApplicationController
  
  def task_done
    @project = Project.find(params[:id])  
    @task = @project.tasks.find(params[:task_id])
    @owner = User.find(@task.owner)
    @project.update_attribute("donated_time", @project.donated_time + @task.time_value)
    @owner.update_attribute("time_budget", @owner.time_budget + @task.time_value)
    @task.update_attribute(:status, "done")
     
    
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Task done.' }
      format.json { render json: @project }
    end
  end
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    #@project = Project.where(_id: Moped::BSON::ObjectId("50cf8b9e4ba807e959000006"))
   @project = Project.find(params[:task][:project])
   @task = Task.new(:title => params[:task][:title], :description => params[:task][:description], :time_value => params[:task][:time_value], :status => "open")
   @task.project = @project
   @project.update_attribute("time_budget", @project.time_budget + @task.time_value )

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
