class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      # Envoyer un email de notification (à configurer)
      # ContactMailer.new_contact_notification(@contact).deliver_later
      
      redirect_to root_path, notice: 'Mesajınız başarıyla gönderildi. En kısa sürede size dönüş yapacağız.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end 


