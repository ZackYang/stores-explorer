class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  http_basic_authenticate_with name: "allen", password: "bindo"
  
  protect_from_forgery with: :exception
end
