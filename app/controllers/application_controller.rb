class ApplicationController < ActionController::Base
  Paperclip.options[:command_path] = "/usr/bin"

  protect_from_forgery
end
