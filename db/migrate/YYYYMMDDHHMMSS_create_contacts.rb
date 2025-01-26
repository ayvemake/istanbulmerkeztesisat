class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.text :message, null: false
      t.string :service_type
      t.boolean :urgent, default: false

      t.timestamps
    end
  end
end 