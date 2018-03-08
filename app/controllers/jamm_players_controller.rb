class JammPlayersController < ApplicationController
before_action :set_jamm_player, only: [:new, :create, :update, :edit, :destroy]

  def create
     @jamm_player = Jamm.new(jamm_id: params[:id])
    if @jamm_player.save
      redirect_to jamm_path
    end
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
    @jamm = Jamm.find(params[:id])
  end

  def jamm_player_params
    params.require(:jamm_player).permit(:name)
  end
end
