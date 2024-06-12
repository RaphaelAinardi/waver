class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :image
      t.string :brand
      t.string :shape
      t.float :length
      t.float :width
      t.float :thickness
      t.integer :user_id

      t.timestamps
    end
  end
end
