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
<<<<<<< HEAD
  def set_jamm
    @jamm = Jamm.find(params[:jamm_id])
  end
  def set_jamm_player
    @jamm_player = Jamm_player.find(params[:id])
=======

  def set_jamm
    @jamm = Jamm.find(params[:jamm_id])
>>>>>>> f254bc008581f0cfd7337e0226f838ceb390ce67
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
