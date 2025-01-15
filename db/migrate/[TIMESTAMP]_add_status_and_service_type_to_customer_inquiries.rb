class AddStatusAndServiceTypeToCustomerInquiries < ActiveRecord::Migration[7.1]
  def change
    add_column :customer_inquiries, :inquiry_status, :integer, default: 0, null: false
    add_column :customer_inquiries, :service_type, :integer, null: false
    
    add_index :customer_inquiries, :inquiry_status
    add_index :customer_inquiries, :service_type
  end
end 