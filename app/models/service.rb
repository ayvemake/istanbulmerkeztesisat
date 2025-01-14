class Service < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  enum :category, {
    plomberie_generale: 'plomberie_generale',
    chauffage: 'chauffage',
    climatisation: 'climatisation',
    urgence: 'urgence'
  }, prefix: true

  # Scopes for easy querying
  scope :active, -> { where(active: true) }
  scope :by_category, ->(category) { where(category: category) }
  scope :featured, -> { active.limit(4) }
end 