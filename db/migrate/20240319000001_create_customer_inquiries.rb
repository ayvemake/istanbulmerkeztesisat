class CreateCustomerInquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_inquiries do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone, null: false
      t.text :message
      t.string :service_type
      t.string :status, default: 'pending'
      t.string :preferred_contact_method
      t.datetime :preferred_time

      t.timestamps
    end

    add_index :customer_inquiries, :status
    add_index :customer_inquiries, :created_at
  end
end 