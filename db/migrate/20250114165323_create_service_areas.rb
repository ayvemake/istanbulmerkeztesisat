class CreateServiceAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :service_areas do |t|
      t.string :name
      t.text :description
      t.string :postal_codes, array: true

      t.timestamps
    end
  end
end
