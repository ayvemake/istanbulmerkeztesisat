class CustomerInquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true
  validates :service_type, presence: true

  attribute :service_type, :integer
  attribute :inquiry_status, :integer

  enum inquiry_status: {
    inquiry_pending: 0,
    inquiry_in_progress: 1,
    inquiry_completed: 2,
    inquiry_cancelled: 3
  }

  enum service_type: {
    leak_detection: 0,      # Su Kaçağı Tespiti
    plumbing_repair: 1,     # Tesisat Tamiri
    drain_cleaning: 2,      # Tıkanıklık Açma
    heating_maintenance: 3,  # Kombi Bakım
    ac_service: 4,          # Klima Servisi
    painting: 5,            # Boya
    electrical: 6           # Elektrik
  }, _prefix: 'service'

  after_create :send_notification

  private

  def send_notification
    CustomerInquiryNotificationJob.perform_later(self)
  end
end 