class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    unless user_signed_in?
      redirect_to new_user_session_url, :alert => exception.message
    else
      redirect_to root_url, :alert => exception.message
    end
  end
end
