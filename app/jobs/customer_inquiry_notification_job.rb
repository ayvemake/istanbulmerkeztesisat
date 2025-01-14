class CustomerInquiryNotificationJob < ApplicationJob
  queue_as :default

  def perform(customer_inquiry)
    Rails.logger.info "Yeni müşteri talebi: #{customer_inquiry.name}"
    
    # Gelecekte entegre edilecek bildirim mekanizmaları
    # SlackNotifier.ping("Yeni müşteri talebi: #{customer_inquiry.name}")
  end
end 