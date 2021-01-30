class ApplicationController < ActionController::Base

    helpers do
        def current_user
            @current_user ||= User.find_by_id(session[user_id])
        end

    end
end
