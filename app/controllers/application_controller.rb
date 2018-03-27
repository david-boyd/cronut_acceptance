class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  rescue_from StandardError do |exception|
    respond_to do |format|
      format.any(:html) do
        if Rails.env.development?
          raise exception
        else
          @error_msg = exception.message
          render :template => "errors/server_error", :status => 500, :formats => [:html]
        end
      end
    end
  end
end
