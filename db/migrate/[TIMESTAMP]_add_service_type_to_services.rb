class AddServiceTypeToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :service_type, :integer, default: 0
    add_index :services, :service_type
  end
end 