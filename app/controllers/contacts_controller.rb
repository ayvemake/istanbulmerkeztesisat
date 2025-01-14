class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('contact_form', 
              partial: 'contacts/success', 
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
            'contact_form', 
            partial: 'contacts/form', 
            locals: { contact: @contact }
          )
        end
        format.html { render :new }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :message)
  end
end 


