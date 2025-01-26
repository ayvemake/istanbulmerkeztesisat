class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A[+]?[\d\s-]{7,}\z/ }
  validates :message, presence: true, length: { minimum: 10, maximum: 1000 }
end 