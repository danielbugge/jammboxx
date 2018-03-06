class JammPlayersController < ApplicationController
before_action :set_jamm_player, only: [:show, :edit, :update, :delete]


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

  def set_jamm_player
    @jamm_player = Jamm_player.find(params[:id])
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
