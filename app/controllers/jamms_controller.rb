class JammsController < ApplicationController
  before_action :set_jamm, only: [:show, :edit, :update, :delete]

  def index
    @jamm = Jamm.all
  end

  def show
  end

  def new
    @jamm = Jamm.new
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

  def set_jamm
    @jamm = Jamm.find(params[:id])
  end

  def jamm_params
    params.require(:jamm).permit(:name, :address, :description, :genre, :date)
  end
end
