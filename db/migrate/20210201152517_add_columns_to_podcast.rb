class AddColumnsToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :user_id, :integer
    add_column :podcasts, :topic_id, :integer
  end
end
