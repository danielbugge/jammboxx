class JammPlayersController < ApplicationController
before_action :set_jamm, only: [:new, :create, :update, :edit, :destroy]

  def new
    @jamm_player = JammPlayer.new(jamm_id: @jamm.id)
    authorize @jamm_player
  end

  def create
    @jamm_player.save
    authorize @jamm
  end

  def edit
  end

  def update
  end


  def destroy
  end

  private

  def set_jamm
    @jamm = Jamm.find(params[:jamm_id])
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
