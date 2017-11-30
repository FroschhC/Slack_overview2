class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_owner?

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end

  def authenticate_user!
    if current_user.nil?
      flash[:notice] = "You gotta be signed in"
      redirect_to root_path
    end
  end

  def authenticate_owner!(resource)
    if !is_owner?(resource)
      flash[:notice] = "You gotta be the owner"
      redirect_to root_path
    end
  end

  def is_owner?(resource)
    current_user == resource.user
  end
end
