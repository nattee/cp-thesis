class ApplicationController < ActionController::Base
  protected

  def current_user
    return nil unless session[:user_id]
    return @current_user if @current_user
    @current_user = User.find(session[:user_id])

    return @current_user
  end

  def require_logged_in
    return true if current_user
    redirect_to root_path
  end
end
