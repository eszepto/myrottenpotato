class ApplicationController < ActionController::Base
    require 'httparty'
    require 'dotenv/load'

    protect_from_forgery with: :exception
    before_action :set_current_user
    
    def set_current_user
        @current_user = Moviegoer.find_by(id: session[:user_id])
    end
    
    protected
    def authenticate!
        unless @current_user
            redirect_to login_path
        end
    end
end
