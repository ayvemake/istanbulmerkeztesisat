class UpdateContactsTable < ActiveRecord::Migration[8.0]
  def change
    # Ajouter des colonnes si elles n'existent pas déjà
    add_column :contacts, :email, :string, if_not_exists: true
    add_column :contacts, :status, :integer, default: 0, if_not_exists: true

    # Ajouter un index si nécessaire
    add_index :contacts, :email, if_not_exists: true
    add_index :contacts, :status, if_not_exists: true
  end
end 