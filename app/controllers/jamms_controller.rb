class JammsController < ApplicationController
  before_action :set_jamm, only: [:show, :edit, :update, :delete]

  def index
    @jamms = policy_scope(Jamm.all)
    @jamm_players = JammPlayer.all
  end

  def show

    @jamm = Jamm.where.not(latitude: nil, longitude: nil)
    @markers = @jamm.map do |jamm|
      {
        lat: jamm.latitude,
        lng: jamm.longitude#,
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
