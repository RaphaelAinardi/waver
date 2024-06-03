class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :first_user, null: false
      t.references :second_user, null: false

      t.timestamps
    end
  end
end
