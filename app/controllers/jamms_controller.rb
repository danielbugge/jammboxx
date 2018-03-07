class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:show, :search]
  skip_after_action :verify_policy_scoped, only: [:index]
  before_action :set_jamm, only: [:show, :edit, :update, :delete]

  def index
    @jamms = policy_scope(Jamm.all)
<<<<<<< HEAD
    @instruments = Instruments.all
=======
    @jamm_players = JammPlayer.all
>>>>>>> b6eaa1f0499f2f56f774413e177451c27bf98a00
  end

  def show
     @jamm_players = JammPlayer.where(jamm_id: params[:id]).last

    # needs to be tailored to one not to show many:
    @jamm = Jamm.find(params[:id])
    @jamm1 = Jamm.where.not(latitude: nil, longitude: nil)
    @markers = @jamm1.map do |jamm|
      {
        lat: jamm.latitude,
        lng: jamm.longitude
         # infoWindow: { content: render_to_string(partial: "/jamm/map_box", locals: { jamm: jamm }) }
      }
    end

  end

  def create
    @jamm = Jamm.new(jamm_params)
    if @jamm.save
      redirect_to jamm_index_path
    else
      render :new
    end
  end

  def new
    @jamm = Jamm.new
  end

  def edit
  end

  def update
    @jamm.update(jamm_params)
    redirect_to jamm_index_path
  end

  def search
  end

  def destroy
    @jamm.destroy
    redirect_to jamm_index_path
  end

  private

  def set_jamm
    @jamm = Jamm.find(params[:id])
  end

  def jamm_params
    params.require(:jamm).permit(:name, :address, :description, :genre, :date)
  end
end
