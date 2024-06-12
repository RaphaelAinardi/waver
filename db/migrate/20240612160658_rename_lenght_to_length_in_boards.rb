class RenameLenghtToLengthInBoards < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :lenght, :length
  end
end
