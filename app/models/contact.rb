class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :phone, :string
  attribute :message, :string

  validates :name, presence: true
  validates :message, presence: true
end
