class AddColumnToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :airTemperature, :integer
    add_column :spots, :cloudCover, :float
    add_column :spots, :currentDirection, :string
    add_column :spots, :currentSpeed, :float
    add_column :spots, :seaLevel, :string
    add_column :spots, :swellDirection, :integer
    add_column :spots, :swellPeriod, :integer
    add_column :spots, :waveHeight, :string
    add_column :spots, :windDirection, :integer
    add_column :spots, :windSpeed, :string
    add_column :spots, :waterTemperature, :integer
  end
end
