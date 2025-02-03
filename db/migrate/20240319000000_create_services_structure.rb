class CreateServicesStructure < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.string :category
      t.boolean :urgent, default: false
      t.boolean :available_24_7, default: false
      t.boolean :featured, default: false
      t.boolean :active, default: true

      t.timestamps
    end

    create_table :service_advantages do |t|
      t.references :service, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    add_index :services, :category
    add_index :services, :urgent
    add_index :services, :featured
  end
end 