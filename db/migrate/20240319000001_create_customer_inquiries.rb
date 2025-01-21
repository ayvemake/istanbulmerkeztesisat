class CreateCustomerInquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_inquiries do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.string :service_type
      t.text :message
      t.string :status, default: 'pending'
      t.string :preferred_contact_method
      t.string :preferred_time
      t.string :location
      t.boolean :urgent, default: false
      t.datetime :scheduled_at
      t.datetime :completed_at

      t.timestamps
    end

    add_index :customer_inquiries, :status
    add_index :customer_inquiries, :urgent
  end
end 