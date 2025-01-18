class Service < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  scope :active, -> { where(active: true) }
end 