class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :show ]

  def home
    @transparent_navbar = true
    @jamms = Jamm.where(genre_id: current_user.genre_id)
  end

end
