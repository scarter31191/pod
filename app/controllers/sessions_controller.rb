class SessionsController < ApplicationController

    def omniauth
        user = User.create_from_omniauth(auth)
        # byebug
        if user.save
            session[:user_id] = user.id
            redirect_to users_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to root_path
        end
    end

    def new
        @user = User.new
        render :login
    end

    def create
        # byebug
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end

    def welcome

    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end