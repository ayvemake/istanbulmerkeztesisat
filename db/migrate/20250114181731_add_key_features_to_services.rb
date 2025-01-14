class AddKeyFeaturesToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :key_features, :string
  end
end
