class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locate
  def set_locate
    # I18n.locale = params[:lang] if params[:lang].present?
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || extract_locale_from_accept_language_header

  end

  # default langage from browser
  def extract_locale_from_accept_language_header     
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first   
  end   

end
