class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

 def contact
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :message))
    if @contact.valid?
      ContactMailer.contact_mail(@contact).deliver_now
      redirect_to root_path, notice: 'Obrigado pelo contato, reponderemos em breve'
    else
      render :home
    end
  end
end
