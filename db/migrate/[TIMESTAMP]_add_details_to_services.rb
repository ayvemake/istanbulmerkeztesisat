class AddDetailsToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :detailed_description, :text
    add_column :services, :work_steps, :json, default: []
    add_column :services, :equipment, :json, default: []
    add_column :services, :gallery_images, :json, default: []
    add_column :services, :advantages, :json, default: []
  end
end 