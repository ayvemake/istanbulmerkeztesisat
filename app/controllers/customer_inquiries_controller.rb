class CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new(service_type: params[:service_type])
    @service = Service.find_by(service_type: params[:service_type]) if params[:service_type].present?
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)

    if @customer_inquiry.save
      # Envoyer les emails
      InquiryMailer.new_inquiry_notification(@customer_inquiry).deliver_later
      InquiryMailer.customer_confirmation(@customer_inquiry).deliver_later if @customer_inquiry.email.present?

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('inquiry_form', 
              partial: 'success',
              locals: { message: 'Mesajınız başarıyla gönderildi.' }
            ),
            turbo_stream.append('notifications',
              partial: 'shared/toast',
              locals: { type: 'success', message: 'Talebiniz alındı, en kısa sürede size dönüş yapacağız.' }
            )
          ]
        end
        format.html { redirect_to root_path, notice: 'Talebiniz alındı.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            'inquiry_form',
            partial: 'form',
            locals: { customer_inquiry: @customer_inquiry }
          )
        end
        format.html { render :new }
      end
    end
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:name, :email, :phone, :message, :service_type)
  end
end 