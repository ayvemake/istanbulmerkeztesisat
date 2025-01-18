class CustomerInquiriesController < ApplicationController
  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)
    
    if @customer_inquiry.save
      redirect_to root_path, notice: 'Mesajınız başarıyla gönderildi.'
    else
      redirect_to root_path, alert: 'Mesajınız gönderilemedi. Lütfen tekrar deneyin.'
    end
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:name, :email, :phone, :message, :service_type)
  end
end 