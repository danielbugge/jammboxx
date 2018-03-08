class JammPlayersController < ApplicationController
before_action :set_jamm_player, only: [:new, :create, :update, :edit, :destroy]

  def new
    @jamm_player = Jamm_player.new
    #Is leader method needed in private
    authorize @jamm_player
  end

  def create
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
  def set_jamm_player
    @jamm_player = Jamm_player.find(params[:id])
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
