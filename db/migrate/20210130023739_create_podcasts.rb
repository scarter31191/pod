class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :platfrom
      t.string :host
      t.timestamp :schedule
      t.text :description
      t.string :genre
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
