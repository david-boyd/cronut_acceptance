class WidgetController < ApplicationController
  include LinkHelper

  def index
    cronut_url = params[:cronuts_url].present? ? params[:cronuts_url] : APP_CONFIG['cronut_url']
    donut_url = params[:donuts_url].present? ? params[:donuts_url] : APP_CONFIG['donut_url']

    @cronut_link = link(cronut_url, I18n.t('cronuts_title'))
    @donut_link = link(donut_url, I18n.t('donuts_title'))
  end
end