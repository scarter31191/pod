class ChangeSomeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :podcasts, :platfrom, :platform
  end
end
