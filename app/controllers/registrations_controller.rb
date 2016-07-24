class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    :new_profil # or '/an/example/path'
  end

  def after_sign_in_path_for(resource)
  	:dashboards_home
  end
end