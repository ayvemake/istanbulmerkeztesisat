class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :active, default: true

      t.timestamps
    end
    
    add_index :services, :category
  end
end 