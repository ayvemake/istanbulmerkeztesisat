class Advantage
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :description, :string
  attribute :service_id, :integer

  validates :title, presence: true
  validates :description, presence: true
end
