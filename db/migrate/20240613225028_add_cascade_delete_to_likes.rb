class AddCascadeDeleteToLikes < ActiveRecord::Migration[7.1]
  def change
    # Supprimer la clé étrangère existante
    remove_foreign_key :likes, :experiences

    # Ajouter une nouvelle clé étrangère avec suppression en cascade
    add_foreign_key :likes, :experiences, on_delete: :cascade
  end
end
