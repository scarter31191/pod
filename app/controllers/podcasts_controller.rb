class PodcastsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_podcast, only: [:show, :update, :edit, :destroy]
    

    def index
        if params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
            @podcasts = @topic.podcasts
        else
            @podcasts = Podcast.order_by_title
        end
    end

    def new
        if params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
            @podcast = @topic.podcasts.build
            # byebug
        else
            @podcast = Podcast.new
            @podcast.build_topic
            # @user = current_user
        end
    end

    def create
        # byebug
        @podcast = Podcast.new(podcast_params)
        # @user = current_user
        @podcast = current_user.podcasts.build(podcast_params)
        # byebug
        if @podcast.save
            redirect_to podcast_path(@podcast)
        else
            render :new
        end
    end

    def show
        # @podcast = Podcast.find(params[:id])
        # byebug
    end

    def edit
        # @podcast = Podcast.find(params[:id])
        if @podcast.user != current_user
            redirect_to user_path(current_user), alert: "You can't edit this pod!"
        end
    end

    def update
        # @podcast = Podcast.find(params[:id])

        if @podcast.update(podcast_params)
            redirect_to podcast_path(@podcast)
        else
            render :edit
        end
    end

    def destroy
        # @podcast = Podcast.find(params[:id])
        if @podcast.user != current_user
            redirect_to user_path(current_user), alert: "You can't edit this pod!"
        else
            @podcast.destroy
            redirect_to podcasts_path
        end
        
    
        
    end

    private

    def find_podcast
        @podcast = Podcast.find(params[:id])
    end

    def podcast_params
        params.require(:podcast).permit(:title, :platform, :host, :schedule, :description, :genre, :user_id, :topic_id, topic_attributes: [:title, :body])
    end
end
