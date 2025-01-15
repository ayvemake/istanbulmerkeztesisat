class AddServiceTypeToCustomerInquiries < ActiveRecord::Migration[7.1]
  def change
    add_column :customer_inquiries, :service_type, :integer
    add_index :customer_inquiries, :service_type
  end
end 