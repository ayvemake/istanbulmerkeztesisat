class Testimonial < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }
end 