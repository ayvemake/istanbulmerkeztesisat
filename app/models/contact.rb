class Contact < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true, format: { 
    with: /\A\+?90\s?[0-9]{3}\s?[0-9]{3}\s?[0-9]{2}\s?[0-9]{2}\z/, 
    message: "Geçerli bir telefon numarası girin" 
  }
  validates :message, presence: true, length: { minimum: 10, maximum: 500 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  enum status: {
    new: 0,
    in_progress: 1,
    completed: 2
  }

  after_create :send_notification

  private

  def send_notification
    # Gelecekte e-posta bildirimi eklenecek
    ContactNotificationJob.perform_later(self)
  end
end 