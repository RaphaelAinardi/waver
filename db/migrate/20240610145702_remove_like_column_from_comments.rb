class RemoveLikeColumnFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :like, :boolean
  end
end
