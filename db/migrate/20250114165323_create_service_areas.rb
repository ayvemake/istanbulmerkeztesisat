class CreateServiceAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :service_areas do |t|
      t.string :name
      t.string :postal_code

      t.timestamps
    end
  end
end
