module ApplicationHelper
  def current_user
    User.find_by_id(session[:user_id]) unless session[:user_id].nil?
  end
end
