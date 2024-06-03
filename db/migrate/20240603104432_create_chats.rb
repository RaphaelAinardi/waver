class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :first_user, null: false, foreign_key: { to_table: :users }
      t.references :second_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
