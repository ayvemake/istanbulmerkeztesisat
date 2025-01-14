class TeamMember < ApplicationRecord
  validates :name, presence: true
  validates :role, presence: true

  def avatar_url
    avatar.presence || 'default_avatar.png'
  end
end 