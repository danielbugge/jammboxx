require_relative '../uploaders/jamm_picture_uploader.rb'

class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:show, :search]
  skip_after_action :verify_policy_scoped, only: [:index]
  before_action :set_jamm, only: [:edit, :update, :delete]

  def index
    @transparent_navbar = true
    @location = params[:city]
    @genre = Genre.find(params[:q][:genre_id_eq]).name if (params[:q] != nil && params[:q][:genre_id_eq].present?)
    @instrument_t = params[:instrument_t]
    @genres = Genre.all
    @instrument_types = InstrumentType.all
    @levels = ["Beginner", "Intermediate", "Expert"]

    if (@location != "" && (@genre != "All" && @genre != nil)  && (@instrument_t != "All" && @instrument_t != nil ))
       @search_params = "#{@location}, #{@genre}, #{@instrument_t}"
    elsif (@location != "" && (@genre != "All" && @genre != nil))
       @search_params = "#{@location}, #{@genre} "
    elsif ((@location != "" &&   @location != "Choose a city" && @location != nil) && @instrument_t != "All" && @instrument_t != nil )
       @search_params = "#{@location}, #{@instrument_t} "
    elsif ((@genre != "All" && @genre != nil) && @instrument_t != "All" && @instrument_t != nil )
       @search_params = "#{@genre}, #{@instrument_t} "
    elsif (@location != "")
       @search_params = "#{@location}"
    elsif ((@genre != "All" && @genre != nil))
       @search_params = "#{@genre}"
    elsif (@instrument_t != "All" && @instrument_t != nil )
       @search_params = "#{@instrument_t}"
    else
       @search_params = "See all"
    end


    #@jamms = policy_scope(Jamm.where.not(latitude: nil, longitude: nil))
    #if params[:city].present?
      #@jamms = Jamm.near(params[:city], 30)
    #end
#
    #if (params[:genre].present? &&  params[:genre] != "Choose a genre")
      #@jamms = @jamms.where(genre: Genre.where(name: params[:genre]))
    #end
#
    #if (params[:instrument_type].present? &&  params[:instrument_type] != "Choose a instrument")
    # HERE WE SHOULD CALD THE METHOD AND THEN RANDSACK
      #@jamms = @jamms.where(instrument_type: Instrument_type.where(name: params[:instrument_type]))
    #end

    if params[:city].present?
      @q = Jamm.near(params[:city], 30).ransack(params[:q])
      @jamms = @q.result(distinct: true)
    else
      @q = policy_scope(Jamm).where.not(latitude: nil, longitude: nil).ransack(params[:q])
      @jamms = @q.result(distinct: true)
    end

    if (params[:instrument_t].present? &&  params[:instrument_t] != "All")
      @jamms = @jamms.jamms_with_spaces_available_for_instrument(params[:instrument_t])
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
    @available_spots = @jamm.max_players - @jamm_players.count
    @instruments = Instrument.where(user_id: current_user)
         # infoWindow: { content: render_to_string(partial: "/jamm/map_box", locals: { jamm: jamm }) }
         # raise
  end

  def create
    @jamm = Jamm.new(jamm_params)
    @jamm.user = current_user
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
    params.require(:jamm).permit(:user_id, :name, :address, :description, :date, :time, :duration, :max_players, :genre_id, :level, :allow_new_instrument, :photo, :jamm_picture, :jamm_picture_cache)
  end
end
