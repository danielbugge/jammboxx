class JammPlayersController < ApplicationController
before_action :set_jamm, only: [:new, :create, :update, :edit, :destroy]

  def new
    authorize @jamm_player
  end

  def create

    if @jamm.user == current_user
      @jamm_player = JammPlayer.new(jamm_id: @jamm.id, instrument_id: params[:jamm_player][:instrument_id])

    else
      @jamm_player = JammPlayer.new(jamm_id: @jamm.id, user: current_user, instrument_id: params[:jamm_player][:instrument_id])
    end

    if @jamm_player.save
      redirect_to @jamm
    end

    authorize @jamm_player
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
    @jamm_player = JammPlayer.find(params[:id])
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
