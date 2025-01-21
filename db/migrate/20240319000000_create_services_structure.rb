class CreateServicesStructure < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.text :detailed_description
      t.string :category, null: false
      t.boolean :featured, default: false
      t.boolean :active, default: true
      t.boolean :urgent, default: false
      t.boolean :available_24_7, default: false
      t.boolean :warranty, default: true
      t.json :work_steps
      t.json :equipment

      t.timestamps
    end

    create_table :service_advantages do |t|
      t.references :service, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    add_index :services, :category
    add_index :services, :featured
    add_index :services, :active
  end
end 