class Testimonial < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true

  scope :latest, ->(limit = 3) { order(created_at: :desc).limit(limit) }
end 