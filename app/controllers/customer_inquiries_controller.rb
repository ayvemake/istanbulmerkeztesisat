class CustomerInquiriesController < ApplicationController
  def new
    @customer_inquiry = CustomerInquiry.new
  end

  def create
    @customer_inquiry = CustomerInquiry.new(customer_inquiry_params)

    if @customer_inquiry.save
      flash[:success] = "Mesajınız başarıyla gönderildi. En kısa sürede size dönüş yapacağız."
      redirect_to root_path
    else
      flash.now[:error] = "Lütfen tüm alanları doğru şekilde doldurunuz."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_inquiry_params
    params.require(:customer_inquiry).permit(:name, :email, :phone, :message)
  end
end 