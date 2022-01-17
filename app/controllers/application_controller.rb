class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def user_status(user)
    @freindship = Freindship.find_by(user_id: current_user.id, freind_id: user.id )
    if !@freindship.nil?
       @freindship.status
    end
  end

  helper_method :user_status
  
end
