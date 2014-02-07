class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(Admin)
        rails_admin_path
      else
        events_path(resource)
      end
  end
  protect_from_forgery
end
