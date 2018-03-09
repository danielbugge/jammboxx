class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :show ]

  def home
    @transparent_navbar = true
  end
end
