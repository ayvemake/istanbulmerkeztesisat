class Service < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  scope :active, -> { where(active: true) }
end 