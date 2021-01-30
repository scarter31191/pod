class PodcastsController < ApplicationController

    def index
        @podcasts = Podcast.all
    end

    def new
        @podcast = Podcast.new
    end

    def create
        @podcast = Podcast.new(podcast_params)

        if @podcast.save
            redirect_to podcast_path(@podcast)
        else
            render :new
        end
    end

    def show
        @podcast = Podcast.find(params[:id])
    end

    def edit
        @podcast = Podcast.find(params[:id])
    end

    def update
        @podcast = Podcast.find(params[:id])

        if @podcast.update(podcast_params)
            redirect_to podcast_path(@podcast)
        else
            render :edit
        end
    end

    def destroy
        @podcast = Podcast.find(params[:id])
        @podcast.destroy
    
        redirect_to podcasts_path
    end

    private

    def podcast_params
        params.require(:podcast).permit(:title, :platform, :host, :schedule, :description, :genre)
    end
end
