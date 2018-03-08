class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :delete]

  def index
  end

  def show
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
    @jamm = Jamm.find(params[:jamm_id])
  end

  def create
    @jamm = Jamm.find(params[:jamm_id])
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to jamm_path(@jamm)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:model, :instrument_type_id)
  end
end
