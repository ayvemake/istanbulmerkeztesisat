class ThermalImage < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true

  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(display_order: :asc) }
end
