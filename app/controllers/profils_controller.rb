class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_filter :check_user, only: [:edit, :update, :destroy, :show]

  respond_to :html

  def index
    if user_signed_in?
      redirect_to dashboards_home_path
    else
      @profils = Profil.all
      respond_with(@profils)
    end
  end

  def show
    respond_with(@profil)
  end

  def new
    if Profil.exists?(:user_id => current_user.id)
      redirect_to dashboards_home_path 
    else
      @profil = Profil.new
      respond_with(@profil)
    end
    
  end

  def edit
    @profil = Profil.find_by(user_id: current_user.id)
  end

  def create
    @profil = Profil.new(profil_params)
    @profil.user_id = current_user.id
    @profil.save
    # respond_with(@profil)
    redirect_to dashboards_home_path 
  end

  def update
    @profil.update(profil_params)
    # respond_with(@profil)
    redirect_to dashboards_home_path 
  end

  def destroy
    @profil.destroy
    respond_with(@profil)
  end

  private
    def set_profil
      @profil = Profil.find(params[:id])
    end

    def profil_params
      params.require(:profil).permit(:user_id, :smartphone_id, :couleur_id, :prenom, :nom, :adresse, :compl_adresse, :imei, :numtel)
    end

    def check_user
      if current_user != @profil.user
        redirect_to dashboards_home_path, alert: "Sorry, this listing belongs to someone else"
      end
    end
end
