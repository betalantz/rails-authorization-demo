class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user
    helper_method :owns_resource?

    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
    rescue_from ActionController::RoutingError, :with => :rescue404
    rescue_from ActionController::InvalidAuthenticityToken, :with => :rescue403
    rescue_from Errors::AuthorizationError, :with => :rescue403

    def rescue404
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
    end

    def rescue403
        render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end

    private
     
    def logged_in?
        !!current_user
    end

    def current_user
        User.find_by_id(session[:user_id])
    end

    def authenticate
        redirect_to login_path unless logged_in?
    end

    def owns_resource?(resource)
        resource.user == current_user
    end

    def authorize(resource)
        raise Errors::AuthorizationError.new if !owns_resource?(resource)
    end

end
