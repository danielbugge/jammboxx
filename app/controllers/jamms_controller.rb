class JammsController < ApplicationController
  before_action :set_jamm, only: [:show, :edit, :update, :delete]

  def index
    @jamm = Jamm.where("name @@ ?", "#{params[:keyword]}")
    # not the good search just for trying
  end

  def show
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
