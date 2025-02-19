class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  # Définir les callbacks par défaut
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  private

  def user_not_authorized
    flash[:alert] = t('errors.unauthorized')
    redirect_to(request.referer || root_path)
  end

  def skip_pundit?
    devise_controller? || Rails.env.test?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
