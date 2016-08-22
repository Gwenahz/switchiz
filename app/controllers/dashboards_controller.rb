class DashboardsController < ApplicationController

	before_filter :authenticate_user!

  def home
  	@profil = Profil.find_by(user_id: current_user.id)
  	if Profil.exists?(:user_id => current_user.id)

  	else
  		redirect_to new_profil_path 
  	end
  end

  def smartphone
  end

  def reparer
    @smartphone = Smartphone.find(current_user.phoneid)
    @profil = Profil.find_by(user_id: current_user.id)
    if Profil.exists?(:user_id => current_user.id)

    else
      redirect_to new_profil_path 
    end
  end
end
