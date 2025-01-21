class CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new(service_type: params[:service])
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)
    
    if @customer_inquiry.save
      redirect_to root_path, notice: 'Talebiniz başarıyla alındı.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:name, :phone, :email, :service_type, :message)
  end
end 