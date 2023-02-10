class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def all_users
    @users = User.all
  end

  def after_sign_in_path_for(resource)
    if resource.email == "admin@example.com"
      admin_dashboard_path
    elsif resource.role == "labor"
      labor_dashboard_path
    elsif resource.role == "user"
      client_dashboard_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    # add role to devise sign up parameters
    attributes = [:avatar, :name, :father_name, :email, :password, :password_confirmation, :current_password, :phone, :role, :skill, :dob, :description, :cnic]
    address_attributes = [:address, :street, :city, :state, :zip, :latitude, :longitude]
    devise_parameter_sanitizer.permit(:sign_up, keys: [attributes])
    devise_parameter_sanitizer.permit(:account_update, keys: [attributes, address_attributes])
  end
end
