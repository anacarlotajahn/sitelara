class ContactMailer < ActionMailer::Base
  def contact_mail(contact)
    @contact = contact
    mail(to: 'email-da-lara@email.com', subject: 'Assunto padrão do email',
         from: "#{@contact.name} <#{@contact.email}>")
  end
end
