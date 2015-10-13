class ApplicationController < ActionController::Base
  authem_for :user
  helper_method :current_user
  protect_from_forgery with: :exception
end
