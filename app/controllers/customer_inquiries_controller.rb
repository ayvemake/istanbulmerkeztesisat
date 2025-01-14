class CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)

    respond_to do |format|
      if @customer_inquiry.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('customer_inquiry_form', 
              partial: 'customer_inquiries/success', 
              locals: { message: 'Mesajınız başarıyla gönderildi.' }
            ),
            turbo_stream.append('notifications', 
              partial: 'shared/toast', 
              locals: { type: 'success', message: 'İletişim formunuz alındı.' }
            )
          ]
        end
        format.html { redirect_to root_path, notice: 'Mesajınız başarıyla gönderildi.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            'customer_inquiry_form', 
            partial: 'customer_inquiries/form', 
            locals: { customer_inquiry: @customer_inquiry }
          )
        end
        format.html { render :new }
      end
    end
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:name, :phone, :email, :message)
  end
end 