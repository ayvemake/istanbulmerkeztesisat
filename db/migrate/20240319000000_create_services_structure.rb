class CreateServicesStructure < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.string :slug
      t.boolean :featured, default: false
      t.integer :position
      t.string :icon_name

      t.timestamps
    end

    create_table :service_advantages do |t|
      t.references :service, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    add_index :services, :slug, unique: true
    add_index :services, :featured
  end
end 