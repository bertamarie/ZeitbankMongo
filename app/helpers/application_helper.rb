module ApplicationHelper
  
  def love_unlove_button(project)
    if (user_signed_in? && !project.fans.where(user_id: current_user.id).exists?) 	
			button_to 'Love', fans_path(project: project, user: current_user)
		elsif (user_signed_in?) 
			button_to "Unlove", { :controller => :fans,
			      :action => 'destroy',  :id => project.id }, :method => :delete
		else
			button_to 'Love', fans_path(project: project, user: current_user)
		end
  end
  def love_counter(project)
    raw("<span class=\"love_counter\">&hearts; #{project.likes}</span>")
  end
  
end

