class ContactNotificationJob < ApplicationJob
  queue_as :default

  def perform(contact)
    # Gelecekte gerçek bildirim mekanizması
    Rails.logger.info "Yeni iletişim talebi: #{contact.name}"

    # Örnek: Slack veya Telegram bildirimi
    # SlackNotifier.ping("Yeni iletişim talebi: #{contact.name}")
  end
end
