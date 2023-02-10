class ContactMailer < ApplicationMailer
  def contact_email(contact_form)
    @name = contact_form.name
    @email = contact_form.email
    @message = contact_form.message

    mail(to: 'aliraxayasir@gmail.com', subject: 'Contact Form')
  end
end
