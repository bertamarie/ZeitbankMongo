class HomeController < ApplicationController
  def index
    @projects_last = Project.all.sort(_id: 1).limit(3) #Last 3 Projects
    @projects_loved = Project.all.sort(_id: -1).limit(3) #3 Top Projects with most likes
  end
end
