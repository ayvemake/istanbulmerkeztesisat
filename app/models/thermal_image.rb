class ThermalImage
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :description, :string
  attribute :image_path, :string

  validates :title, presence: true

  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(display_order: :asc) }
end
