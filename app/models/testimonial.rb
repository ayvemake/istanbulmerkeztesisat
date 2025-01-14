class Testimonial < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :rating, numericality: { in: 1..5 }, allow_nil: true

  scope :recent, -> { order(created_at: :desc).limit(3) }
end 