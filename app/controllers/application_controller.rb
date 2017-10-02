class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if session[:host_id]
      @current_user = Host.find(session[:host_id])
    elsif session[:entertainer_id]
      @current_user = Entertainer.find(session[:entertainer_id])
    end
  end

  def logged_in?
    current_user != nil
  end

  def welcome
  end
end
