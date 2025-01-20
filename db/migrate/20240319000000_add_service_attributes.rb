class AddServiceAttributes < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:services, :featured)
      add_column :services, :featured, :boolean, default: false
    end

    unless column_exists?(:services, :active)
      add_column :services, :active, :boolean, default: true
    end

    unless column_exists?(:services, :urgent)
      add_column :services, :urgent, :boolean, default: false
    end

    unless column_exists?(:services, :available_24_7)
      add_column :services, :available_24_7, :boolean, default: false
    end

    unless column_exists?(:services, :warranty)
      add_column :services, :warranty, :boolean, default: true
    end
  end
end 