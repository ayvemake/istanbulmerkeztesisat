class UpdateServicesTable < ActiveRecord::Migration[8.0]
  def change
    # Ajouter des colonnes si elles n'existent pas déjà
    add_column :services, :category, :string, if_not_exists: true
    add_column :services, :price, :decimal, precision: 10, scale: 2, if_not_exists: true
    add_column :services, :active, :boolean, default: true, if_not_exists: true
    add_column :services, :meta_keywords, :string, if_not_exists: true

    # Ajouter un index si nécessaire
    add_index :services, :category, if_not_exists: true
  end
end 