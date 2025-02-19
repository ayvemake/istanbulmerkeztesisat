class CustomerInquiry
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :phone, :string
  attribute :email, :string
  attribute :message, :string
  attribute :service_type, :string

  validates :name, presence: true
  validates :phone, presence: true
  validates :message, presence: true

  enum :status, {
    pending: 'pending',
    contacted: 'contacted',
    scheduled: 'scheduled',
    completed: 'completed',
    cancelled: 'cancelled'
  }

  enum :preferred_contact_method, {
    phone: 'phone',
    email: 'email',
    whatsapp: 'whatsapp'
  }, default: 'phone'

  scope :recent, -> { order(created_at: :desc) }
  scope :urgent_first, -> { order(urgent: :desc, created_at: :desc) }
  scope :pending, -> { where(status: 'pending') }
end
