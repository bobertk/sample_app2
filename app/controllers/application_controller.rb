class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper  # Rails authentication module
end
