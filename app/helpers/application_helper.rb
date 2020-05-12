module ApplicationHelper
  def current_user
    unless session[:user_id].nil?
      User.find_by_id(session[:user_id])
    else
      nil
    end
  end
end
