class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message, null: false
      t.boolean :processed, default: false

      t.timestamps
    end

    add_index :contacts, :email
    add_index :contacts, :processed
  end
end 