class WidgetController < ApplicationController
  include LinkHelper

  def index
    cronut_url = ExternalUrl.new(params[:cronuts_url].present? ? params[:cronuts_url] : APP_CONFIG['cronut_url'])
    donut_url =  ExternalUrl.new(params[:donuts_url].present? ? params[:donuts_url] : APP_CONFIG['donut_url'])

    raise I18n.t('url_invalid',title:'cronuts_url') unless cronut_url.valid?
    raise I18n.t('url_invalid',title:'donuts_url') unless donut_url.valid?

    @cronut_link = link(cronut_url.path, I18n.t('cronuts_title'))
    @donut_link = link(donut_url.path, I18n.t('donuts_title'))
  end
end