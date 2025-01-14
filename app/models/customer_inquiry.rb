class CustomerInquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :message, presence: true, length: { minimum: 10, maximum: 500 }
  
  # Utilisez une méthode de classe pour l'enum
  enum status: {
    new: 0,
    in_progress: 1,
    completed: 2
  }

  after_create :send_notification

  private

  def send_notification
    # Utilisez un job de background seulement si le job existe
    CustomerInquiryNotificationJob.perform_later(self) if defined?(CustomerInquiryNotificationJob)
  end
end 