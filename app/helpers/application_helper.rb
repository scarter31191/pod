module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
       !! current_user 
    end

    def redirect_if_not_logged_in   
        # flash[:notice] = "Must Login or Sign up" 
        redirect_to :root unless logged_in?
    end

    def render_nav_bar
        if logged_in?
          render partial: 'layouts/logged_in'
        else
          render partial: 'layouts/logged_out'
        end
    end

end
