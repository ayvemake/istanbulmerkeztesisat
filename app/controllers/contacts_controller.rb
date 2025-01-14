class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append('contacts', partial: 'contacts/success'),
            turbo_stream.replace('contact_form', partial: 'contacts/form', locals: { contact: Contact.new })
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('contact_form', partial: 'contacts/form', locals: { contact: @contact })
        end
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :message)
  end
end 


