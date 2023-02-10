class ContactUsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.deliver
      render json: {message: "Email sent successfully"}
      # ContactMailer.contact_email(@contact_form).deliver_now
      flash[:notice] = "Thank you for your message. We will respond to you as soon as possible."
    else
      render :new
      flash[:alert] = "There was an error sending your message. Please try again."
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
