class CustomerInquiry
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :phone, :string
  attribute :email, :string
  attribute :message, :string
  attribute :service_type, :string
  attribute :status, :string, default: 'pending'
  attribute :preferred_contact_method, :string, default: 'phone'

  validates :name, presence: true
  validates :phone, presence: true
  validates :message, presence: true

  STATUSES = {
    pending: 'pending',
    contacted: 'contacted',
    scheduled: 'scheduled',
    completed: 'completed',
    cancelled: 'cancelled'
  }.freeze

  CONTACT_METHODS = {
    phone: 'phone',
    email: 'email',
    whatsapp: 'whatsapp'
  }.freeze

  def self.statuses
    STATUSES
  end

  def self.contact_methods
    CONTACT_METHODS
  end

  def pending?
    status == STATUSES[:pending]
  end

  def contacted?
    status == STATUSES[:contacted]
  end

  def scheduled?
    status == STATUSES[:scheduled]
  end

  def completed?
    status == STATUSES[:completed]
  end

  def cancelled?
    status == STATUSES[:cancelled]
  end

  # Remplacer les scopes par des méthodes de classe
  def self.recent
    all.sort_by(&:created_at).reverse
  end

  def self.urgent_first
    all.sort_by { |inquiry| [inquiry.urgent ? 0 : 1, inquiry.created_at] }
  end

  def self.pending
    all.select { |inquiry| inquiry.status == STATUSES[:pending] }
  end
end
