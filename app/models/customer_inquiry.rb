class CustomerInquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }

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
