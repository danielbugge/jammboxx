class JammPlayersController < ApplicationController
before_action :set_jamm, only: [:new, :create, :update, :edit, :destroy]
before_action :set_jamm_player, only: [:update, :destroy]

  def new
    authorize @jamm_player
  end

  def create

    if @jamm.user == current_user
      @jamm_player = JammPlayer.new(jamm_id: @jamm.id, user: nil, instrument_id: params[:jamm_player][:instrument_id])

    else
      @jamm_player = JammPlayer.new(jamm_id: @jamm.id, user: current_user, instrument_id: params[:jamm_player][:instrument_id])
    end

    if @jamm_player.save
      redirect_to @jamm
    end

    authorize @jamm_player
  end

  def update
    @jamm_player.user = current_user

    if @jamm_player.save
      redirect_to @jamm
    end
    authorize @jamm_player
  end


  def destroy
    #@jamm_players = JammPlayer.where(jamm_id: @jamm)
    #@jamm_player = @jamm_players.find(user_id: current_user)
    @jamm_player.destroy
      redirect_to @jamm
    authorize @jamm_player
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
