class Contact < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true

  enum status: {
    nouveau: 0,
    en_cours: 1,
    traite: 2
  }

  after_create :notify_admin
  
  private

  def notify_admin
    # Logique future d'envoi de notification
    # Vous pourriez utiliser ActionMailer ici
    ContactMailer.admin_notification(self).deliver_later if Rails.env.production?
  end
end 