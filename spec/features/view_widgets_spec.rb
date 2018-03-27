require 'rails_helper'

RSpec.feature "ViewWidgets", type: :feature do
  scenario 'show default view' do
    visit widget_index_path
    expect(page).to have_content I18n.t('super_terms_html', cronut_link: 'cronuts', donut_link: 'donuts')
  end

  scenario 'view page in english' do
    visit 'en/widget/index'
    expect(page).to have_content I18n.t('super_terms_html', cronut_link: 'cronuts', donut_link: 'donuts')
  end

  scenario 'view page in dutch' do
    visit 'nl/widget/index'
    expect(page).to have_content I18n.t('super_terms_html', locale: :nl, cronut_link: 'cronuts', donut_link: 'donuts')
  end

  scenario 'supplied cronuts url parameter' do
    # default case, should have app_config url
    visit widget_index_path
    expect(page).to have_link('cronuts', href: APP_CONFIG['cronut_url'])

    # shows supplied url
    new_url = 'http://www.google.com'
    visit widget_index_path(cronuts_url: new_url)
    expect(page).to have_link('cronuts', href: new_url)
    expect(page).to have_link('donuts', href: APP_CONFIG['donut_url']) #remains unchanged
  end

  scenario 'supplied donuts url parameter' do
    # default case, should have app_config url
    visit widget_index_path
    expect(page).to have_link('donuts', href: APP_CONFIG['donut_url'])

    # shows supplied url
    new_url = 'http://www.google.com'
    visit widget_index_path(donuts_url: new_url)
    expect(page).to have_link('donuts', href: new_url)
    expect(page).to have_link('cronuts', href: APP_CONFIG['cronut_url']) #remains unchanged
  end

  scenario 'supply both donuts and cronuts urls' do
    new_donut_url = 'http://www.dontdonut.com'
    new_cronuts_url = 'http://www.cronutsnumberone.com'
    visit widget_index_path(donuts_url: new_donut_url,cronuts_url: new_cronuts_url)
    expect(page).to have_link('donuts', href: new_donut_url)
    expect(page).to have_link('cronuts', href: new_cronuts_url)
  end

  scenario 'supply invalid url' do
    #url must supply full http path
    invalid = 'www.dontdonut.com'
    visit widget_index_path(donuts_url: invalid)
    expect(page).to have_content I18n.t('url_invalid', title: 'donuts_url')

    visit widget_index_path(cronuts_url: invalid)
    expect(page).to have_content I18n.t('url_invalid', title: 'cronuts_url')
  end
end