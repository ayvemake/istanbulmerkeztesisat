class InquiryMailer < ApplicationMailer
  default from: ENV.fetch('SMTP_USERNAME', nil)

  def new_inquiry_notification(inquiry)
    @inquiry = inquiry
    @service = Service.find_by(service_type: inquiry.service_type)

    mail(
      to: ENV.fetch('ADMIN_EMAIL', nil),
      subject: t('inquiry_mailer.new_inquiry.subject', service: @service&.name || 'Service général')
    )
  end

  def customer_confirmation(inquiry)
    @inquiry = inquiry
    @service = Service.find_by(service_type: inquiry.service_type)

    mail(
      to: @inquiry.email,
      subject: t('inquiry_mailer.confirmation.subject')
    )
  end

  def confirmation_email
    @inquiry = params[:inquiry]
    mail(
      to: @inquiry.email,
      subject: t('inquiry_mailer.confirmation.subject')
    )
  end
end
