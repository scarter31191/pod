class TopicsController < ApplicationController
    before_action :find_topic, :redirect_if_not_logged_in, only: [:show, :update, :edit, :destroy]
    
    def index
        @topics = Topic.all
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = current_user.topics.build(topic_params)

        if @topic.save
            redirect_to topic_path(@topic)
        else
            render :new
        end
    end

    def show
    end

    def edit
        podcast = find_topic_user(@topic)
        # byebug
        if podcast[0].user.id != current_user.id
            # byebug
            redirect_to user_path(current_user)
        end
    end

    def update

        if @topic.update(topic_params)
            redirect_to topic_path(@topic)
        else
            render :edit
        end
    end

    def destroy
        # byebug
        # @topic = Topic.find(params[:id])
        if @topic.users != current_user
            redirect_to user_path(current_user), alert: "You can't edit this pod!"
        else
            @topic.destroy
            redirect_to topics_path
        end
    end
    


    private

      def find_topic
        @topic = Topic.find(params[:id])
      end

    def topic_params
        params.require(:topic).permit(:title, :body, :podcast_id)
    end

    def find_topic_user(topic)
        all_podcasts = topic.podcasts
        all_podcasts.each do |pod|
          users = []
          user = pod.user.id
          users << user
          users.each do |user|
            if user == current_user.id
                # byebug
             true
            else
             false
            end
          end
        end
    end

end
