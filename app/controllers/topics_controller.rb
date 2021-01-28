class TopicsController < ApplicationController

    def index
        @topics = Topic.all
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic
    end
end
