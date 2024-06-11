class AddBoardsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :boards, :string
  end
end
