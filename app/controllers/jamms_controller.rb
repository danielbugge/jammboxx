class JammsController < ApplicationController
  def index
  end

  def show
  end

  def new
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
    params.require(:jamm).permit(:name, :address, :description)
  end
end
