class PrelaunchesController < ApplicationController
  before_action :set_prelaunch, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:index, :edit, :update, :destroy, :show]

  respond_to :html

  def index
    @prelaunches = Prelaunch.all
    @prelaunchescount = 0
    @prelaunchesref = 0
    @prelaunches.each do |prelaunch|
      @prelaunchescount = @prelaunchescount +1
      if prelaunch.ref.blank?
      else
        @prelaunchesref = @prelaunchesref +1
      end
    end

    @ratio = @prelaunchesref.to_i / @prelaunchescount.to_f
    # @prelaunchesref = @prelaunches.count - @prelaunchesnoref 
    respond_with(@prelaunches)
    # redirect_to root_path
  end

  def show
    respond_with(@prelaunch)
  end

  def friends
    @code = params[:code]
    @codefb = "ref="+@code
    @aventurier = Prelaunch.find_by(code: @code)

    if Prelaunch.exists?(code: @code)
    else
      redirect_to root_path, alert: "Votre email est invalide"
    end
    
    # @prelaunch = Prelaunch.find_by(@id)
    # @ref = @prelaunch.code
  end

  def new
    @n = params[:n]
    @inv = params[:inv]
    @cookee = cookies[:refcode]
    if @inv.blank?
    else
      @aventurier = Prelaunch.find_by(code: @inv)
      @comment = @aventurier.commentaire
    end
    @prelaunch = Prelaunch.new
    respond_with(@prelaunch)
  end

  def edit
  end

  def create
    @prelaunch = Prelaunch.new(prelaunch_params)

      if @prelaunch.ref == "" || @prelaunch.ref == nil
        @prelaunch.code = SecureRandom.hex(4) # => "bff1a1a2"
        @prelaunch.count = 0
      else
        if Prelaunch.exists?(code: @prelaunch.ref)
          @referral = Prelaunch.find_by(code: @prelaunch.ref)
          @referral.update(:count => @referral.count+1)
          @prelaunch.code = SecureRandom.hex(4) # => "bff1a1a2"
        end
        @prelaunch.code = SecureRandom.hex(4)
        @prelaunch.count = 0
      end
    
    @prelaunch.save
    cookies[:refcode] = { value: @prelaunch.code, expires: 1.month.from_now }
    # respond_with(@prelaunch)
    redirect_to action: 'friends', code: @prelaunch.code
    
  end

  def update
    @prelaunch.update(prelaunch_params)
    respond_with(@prelaunch)
  end

  def destroy
    @prelaunch.destroy
    respond_with(@prelaunch)
  end

  private
    def set_prelaunch
      @prelaunch = Prelaunch.find(params[:id])
    end

    def prelaunch_params
      params.require(:prelaunch).permit(:email, :commentaire, :count, :code, :ref)
    end
end
