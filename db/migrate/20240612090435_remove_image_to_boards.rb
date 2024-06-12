class RemoveImageToBoards < ActiveRecord::Migration[7.1]
  def change
    remove_column :boards, :image
  end
end
