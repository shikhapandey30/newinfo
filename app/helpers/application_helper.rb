module ApplicationHelper
	def is_active_controller(controller_name)        
    if params[:controller] == "demos"
    	params[:action] == controller_name ? "active" : nil
    else
    	params[:controller] == controller_name ? "active" : nil
    end
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def count_like(comment)
    comment.likes.where(like: true).count
  end
    
  def count_dislike(comment)
    comment.likes.where(like: false).count
  end
end
