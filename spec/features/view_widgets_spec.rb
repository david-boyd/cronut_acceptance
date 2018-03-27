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
  end
end