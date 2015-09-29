class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :alert => t("views.authentication.authentication_required")
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  # Obtener configuración regional del dominio de nivel superior o devolver nil si tal escenario no está disponible
  # por ejemplo:
  # https://pipe-app.herokuapp.com
  # https://pipe-app.herokuapp.es
  # https://pipe-app.herokuapp.pt
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end


end
