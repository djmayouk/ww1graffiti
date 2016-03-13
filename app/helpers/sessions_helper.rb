module SessionsHelper
  # Return true if the given user is the current user
  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  # Redirect to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Store the URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
