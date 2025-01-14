class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :price, precision: 10, scale: 2
      t.boolean :active, default: true
      t.string :meta_keywords

      t.timestamps
    end

    add_index :services, :category
    add_index :services, :active
  end
end 