class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :difficulty
      t.string :wave_type
      t.integer :crowd
      t.float :average_rating

      t.timestamps
    end
  end
end
