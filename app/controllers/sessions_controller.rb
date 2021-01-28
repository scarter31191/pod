class SessionsController < ApplicationController

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
end