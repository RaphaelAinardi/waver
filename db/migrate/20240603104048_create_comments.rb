class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.boolean :like
      t.text :content
      t.references :experience, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
