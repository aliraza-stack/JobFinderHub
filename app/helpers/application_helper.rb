module ApplicationHelper

  def formatted_address(profile)
    "#{profile.address}, #{profile.street} #{profile.city}, #{profile.state}"
  end

end
