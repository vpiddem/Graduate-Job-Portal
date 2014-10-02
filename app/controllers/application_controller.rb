class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :isJobSeeker


  def isJobSeeker
    if current_user.role == 1
      true
    else
      false
    end
  end
end
