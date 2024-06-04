class AddLivecamUrlToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :livecam_url, :string
  end
end
