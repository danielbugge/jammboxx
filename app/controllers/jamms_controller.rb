#require 'byebug'

class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:show, :search]
  skip_after_action :verify_policy_scoped, only: [:index]
  before_action :set_jamm, only: [:edit, :update, :delete]

  def index
    @transparent_navbar = true

    @jamms = policy_scope(Jamm.where.not(latitude: nil, longitude: nil))
    if params[:city].present?
      @jamms = Jamm.near(params[:city], 30)
    end

    if params[:genre].present?
      @jamms = @jamms.where(genre: Genre.where(name: params[:genre]))
    end

    if params[:instrument_type].present?
      @jamms = @jamms.where(instrument_type: Instrument_type.where(name: params[:instrument_type]))
    end




    @markers = @jamms.map do |jamm|
      {
        lat: jamm.latitude,
        lng: jamm.longitude#,
        # infoWindow: { content: render_to_string(partial: "/spaces/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @jamm_players = JammPlayer.where(jamm_id: params[:id])
    @jamm = Jamm.where.not(latitude: nil, longitude: nil).find(params[:id])
    @markers = [{ lat: @jamm.latitude, lng: @jamm.longitude }]
    @jamm_player = JammPlayer.new
         # infoWindow: { content: render_to_string(partial: "/jamm/map_box", locals: { jamm: jamm }) }
         # raise
  end

  def create
    @jamm = Jamm.new(jamm_params)
    @jamm.user = current_user
    # byebug
    if @jamm.save
      redirect_to jamm_path(@jamm)
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
    params.require(:jamm).permit(:user_id, :name, :address, :description, :date, :time, :duration, :max_players, :genre_id, :level, :allow_new_instrument, :photo)
  end
end
