class CustomerInquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true

  # Changez 'status' en 'inquiry_status' pour éviter le conflit
  enum inquiry_status: {
    pending: 0,
    in_progress: 1,
    completed: 2,
    cancelled: 3
  }

  after_create :send_notification

  private

  def send_notification
    CustomerInquiryNotificationJob.perform_later(self)
  end
end 