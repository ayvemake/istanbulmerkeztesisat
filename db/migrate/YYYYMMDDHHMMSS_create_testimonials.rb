class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :rating, default: 5
      t.boolean :active, default: true
      t.datetime :published_at

      t.timestamps
    end

    add_index :testimonials, :active
    add_index :testimonials, :published_at
  end
end 