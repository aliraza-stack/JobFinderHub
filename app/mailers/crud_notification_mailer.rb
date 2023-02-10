class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object
    mail(
      to: "aliraxayasir@gmail.com",
      subject: @object.title
    )
  end

  def update_notification(object)
    @object = object
    mail(
      to: "aliraxayasir@gmail.com",
      # subject: @object.title
    )
  end

  def delete_notification
  end
end
