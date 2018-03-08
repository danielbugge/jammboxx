class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :delete]

  def index
  end

  def show
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create

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
    params.require(:instrument).permit(:name)
  end
end
