class CreateCustomerInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :service_type

      t.timestamps
    end
  end
end 