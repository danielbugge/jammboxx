require 'byebug'

class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:show, :search]
  skip_after_action :verify_policy_scoped, only: [:index]
  before_action :set_jamm, only: [:edit, :update, :delete]

  def index
    @jamms = policy_scope(Jamm.all)
    @instruments = Instruments.all
  end

  def show
    @jamm_players = JammPlayer.where(jamm_id: params[:id]).last
    @jamm = Jamm.where.not(latitude: nil, longitude: nil).find(params[:id])

    @markers = #@jamm.map do |jamm|

      [{
        lat: @jamm.latitude,
        lng: @jamm.longitude
         # infoWindow: { content: render_to_string(partial: "/jamm/map_box", locals: { jamm: jamm }) }
      }]
  end

  def create
    @jamm = Jamm.new(jamm_params)
    if @jamm.save
      redirect_to jamm_index_path
    else
      render :new
    end
    authorize @jamm

  end

  def new
    @jamm = Jamm.new
    authorize @jamm
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
    params.require(:jamm).permit(:name, :address, :description, :date, :time, :duration, :max_players, :genre_id, :level, :allow_new_instrument, :photo)
  end
end
