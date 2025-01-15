class InquiryMailer < ApplicationMailer
  default from: ENV['SMTP_USERNAME']

  def new_inquiry_notification(inquiry)
    @inquiry = inquiry
    @service = Service.find_by(service_type: inquiry.service_type)
    
    mail(
      to: ENV['ADMIN_EMAIL'],
      subject: "Nouvelle demande de service: #{@service&.name || 'Service général'}"
    )
  end

  def customer_confirmation(inquiry)
    @inquiry = inquiry
    @service = Service.find_by(service_type: inquiry.service_type)

    mail(
      to: @inquiry.email,
      subject: 'Nous avons bien reçu votre demande'
    )
  end
end 