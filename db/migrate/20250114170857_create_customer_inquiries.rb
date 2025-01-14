class CreateCustomerInquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_inquiries do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :message
      t.integer :inquiry_status, default: 0

      t.timestamps
    end
  end
end
