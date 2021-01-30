class UsersController < ApplicationController

    def index
        # byebug
    end

    def show
        
    end

    #loading signup page
    def new
        @user = User.new
    end
    #signup
    def create
        # byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
