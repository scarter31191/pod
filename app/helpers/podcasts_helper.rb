module PodcastsHelper

    def display_topic_fields(t)
        if params[:topic_id]
            t.hidden_field :topic_id
        else
            render partial: 'topic_select', locals: {f: t}
        end 
    end 

    def display_nested_header
        if params[:topic_id]
            "Create a new #{@topic.title} podcast"
        else
            "Create New Podcast"
        end 
    end

end
