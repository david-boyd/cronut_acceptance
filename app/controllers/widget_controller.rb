class WidgetController < ApplicationController
  def index
    @cronut_link = link(APP_CONFIG['cronut_url'], I18n.t('cronuts_title'))
    @donut_link = link(APP_CONFIG['donut_url'], I18n.t('donuts_title'))
  end

  private
    def link(url, title)
      "<a href = '#{url}' target = '_blank' >#{title}</a>".html_safe
    end
end