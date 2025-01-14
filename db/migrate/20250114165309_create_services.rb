class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :price
      t.boolean :active
      t.string :meta_keywords

      t.timestamps
    end
  end
end
