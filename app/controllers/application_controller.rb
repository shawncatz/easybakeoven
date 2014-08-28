class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale #http://guides.rubyonrails.org/i18n.html
  # before_filter :authenticate_user!
  before_filter :set_time_zone

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_time_zone
    if current_user
      #logger.info "TIMEZONE: #{current_user.time_zone}"
      Time.zone = current_user.time_zone
    end
  end
end
