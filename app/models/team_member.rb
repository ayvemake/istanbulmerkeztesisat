class TeamMember < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true
  validates :bio, presence: true
end 