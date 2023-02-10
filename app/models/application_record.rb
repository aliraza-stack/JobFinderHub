class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class ContactForm
    include ActiveModel::Model
    attr_accessor :name, :email, :message
    validates :name, :email, :message, presence: true
  end

  def user_type
    if current_user.role == "labor"
      redirect_to labor_dashboard_path
    elsif current_user.role == "user"
      redirect_to client_dashboard_path
    end
  end

end
