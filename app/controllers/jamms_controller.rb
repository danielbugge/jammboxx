require_relative '../uploaders/jamm_picture_uploader.rb'

class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:show, :search]
  skip_after_action :verify_policy_scoped, only: [:index]
  before_action :set_jamm, only: [:edit, :update, :delete, :show]

  def index
    # byebug
    @transparent_navbar = true
    @location = params[:city]
    @genre = Genre.find(params[:q][:genre_id_eq]).name if (params[:q] != nil && params[:q][:genre_id_eq].present?)
    @instrument_t = params[:instrument_t]

    @genres = Genre.all

    @genre_id = @genres.find_by_name(params[:genre]).id if params[:genre] && params[:genre] != "Choose a genre"


    if params[:genre]
      @genre = params[:genre]
      params[:q] = {}
      params[:q]["genre_id_eq"] = @genre_id
    end

    @instrument_types = InstrumentType.all
    @levels = ["Beginner", "Intermediate", "Expert"]
    @instrument_t_id = @instrument_types.where(name: params[:instrument_t]).first.id if params[:instrument_t] && params[:instrument_t] != "Choose an instrument"
    if (@location != "" && (@genre != "All" && @genre && @genre != "Choose a genre" )  && (@instrument_t != "All" && @instrument_t && @instrument_t != "Choose an instrument" ))
       @search_params = "#{@location}, #{@genre}, #{@instrument_t}"
    elsif (@location != "" && (@genre != "All" && @genre && @genre != "Choose a genre"))
       @search_params = "#{@location}, #{@genre} "
    elsif ((@location != "" &&   @location != "Choose your city" && @location) && @instrument_t != "All" && @instrument_t && @instrument_t != "Choose an instrument" )
       @search_params = "#{@location}, #{@instrument_t} "
    elsif ((@genre != "All" && @genre) && @instrument_t != "All" && @instrument_t && @instrument_t != "Choose an instrument" )
       @search_params = "#{@genre}, #{@instrument_t} "
    elsif (@location != "" && @location != nil )
       @search_params = "#{@location}"
    elsif @genre != "All" && @genre && @genre != "Choose a genre"
       @search_params = "#{@genre}"
    elsif (@instrument_t != "All" && @instrument_t && @instrument_t != "Choose an instrument" )
       @search_params = "#{@instrument_t}"
    else
       @search_params = "All"
    end

    if params[:city].present?
      @q = Jamm.near(params[:city], 30).ransack(params[:q])
      @jamms = @q.result(distinct: true)
    else
      @q = policy_scope(Jamm).where.not(latitude: nil, longitude: nil).ransack(params[:q])
      @jamms = @q.result(distinct: true)
    end

    session[:instrument] = params[:instrument_t]
    if (params[:instrument_t].present? &&  (params[:instrument_t] != "All" && params[:instrument_t] != "Choose an instrument"))
      j_array = @jamms.jamms_with_spaces_available_for_instrument(params[:instrument_t])
    end


    @jamms = @jamms & j_array if j_array

    @markers = @jamms.map do |jamm|
      {
        lat: jamm.latitude,
        lng: jamm.longitude#,
      }
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @transparent_navbar = true
    @jamm_players = JammPlayer.where(jamm_id: params[:id])
    #@jamm = Jamm.where.not(latitude: nil, longitude: nil).find(params[:id])
    @markers = [{ lat: @jamm.latitude, lng: @jamm.longitude }]
    @jamm_player = JammPlayer.new

    ### WATCH THIS
    @available_spots_bring_your_own = @jamm.max_players - @jamm_players.count
    ## AND THIS
    @available_spots = @jamm.max_players - @jamm_players.count + @jamm_players.where(user_id: nil).count

    @instruments = Instrument.where(user_id: current_user)
         # infoWindow: { content: render_to_string(partial: "/jamm/map_box", locals: { jamm: jamm }) }
  end

  def create
    @jamm = Jamm.new(jamm_params)
    @jamm.user = current_user
    @jamm.photo = rand(1..23).to_s
    if @jamm.save
      redirect_to jamm_path(@jamm)
    else
      render :new
    end
    authorize @jamm
  end

  def new
    @transparent_navbar = true
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
    params.require(:jamm).permit(:user_id, :name, :address, :description, :date, :time, :duration, :max_players, :genre_id, :level, :allow_new_instrument, :photo, :jamm_picture)
  end
end
