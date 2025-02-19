class ThermalImage
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :description, :string
  attribute :image_path, :string
  attribute :featured, :boolean, default: false
  attribute :display_order, :integer, default: 0

  validates :title, presence: true

  def self.featured
    all.select(&:featured)
  end

  def self.ordered
    all.sort_by(&:display_order)
  end

  # Méthode pour charger toutes les images
  def self.all
    @images ||= begin
      yaml_data = YAML.load_file(Rails.root.join('config/data/thermal_images.yml'))
      yaml_data.map { |data| new(data) }
    end
  end
end
