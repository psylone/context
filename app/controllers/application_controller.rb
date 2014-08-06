class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :login_required

  # helper_method :current_user


  # private

  # def login_required
  #   redirect_to login_path, alert: 'Войдите в Контекст или создайте новый!' unless current_user
  # end

  # def current_user
  #   @current_user ||= User.find session[:user_id] if session[:user_id]
  # end

end
