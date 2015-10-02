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
    I18n.locale = params[:locale] || I18n.default_locale
    #I18n.locale = extract_locale_from_subdomain || I18n.default_locale
    #I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end


  # Obtener configuración de idioma del dominio de nivel superior o devolver nil si tal escenario no está disponible
  # esta opción no se puede usar en Heroku
  # por ejemplo:
  # You have to put something like:
  #   127.0.0.1 localhost.com
  #   127.0.0.1 localhost.es
  #   127.0.0.1 localhost.en
  #   127.0.0.1 localhost.pt
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # Obtener configuración de idioma del subdominio
  # esta opción no se puede usar en Heroku
  # Get locale code from request subdomain (like http://es.pipe-app.localhost.local:3000)
  # You have to put something like:
  #   127.0.0.1 es.localhost.local
  #   127.0.0.1 en.localhost.local
  #   127.0.0.1 pt.localhost.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end



end
