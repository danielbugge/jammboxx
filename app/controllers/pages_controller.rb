class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :show ]

  def home
    @transparent_navbar = true
    @jamms = Jamm.where(genre_id: current_user.genre_id) if user_signed_in?
    @city = params[:city]
    @q = policy_scope(Jamm).where.not(latitude: nil, longitude: nil).ransack(params[:q])

  end

end
