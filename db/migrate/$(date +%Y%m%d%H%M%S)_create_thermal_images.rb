class CreateThermalImages < ActiveRecord::Migration[7.1]
  def change
    create_table :thermal_images do |t|
      t.string :title, null: false
      t.text :description
      t.string :image_url
      t.boolean :featured, default: false
      t.integer :display_order, default: 0

      t.timestamps
    end

    add_index :thermal_images, :display_order
    add_index :thermal_images, :featured
  end
end 