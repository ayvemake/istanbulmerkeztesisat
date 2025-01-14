class CreateCustomerInquiries < ActiveRecord::Migration[8.0]
  def change
    create_table :customer_inquiries do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
