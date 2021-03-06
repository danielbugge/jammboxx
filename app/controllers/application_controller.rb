require_relative '../uploaders/avatar_uploader.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :store_location

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when we sure all the authorizations are okay!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def default_url_options
  { host: ENV["www.jammboxx.site"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :genre_id, :picture, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def store_location
      # store last url as long as it isn't a /users path
      store_location_for(:user, request.fullpath) unless devise_controller?
    # session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
