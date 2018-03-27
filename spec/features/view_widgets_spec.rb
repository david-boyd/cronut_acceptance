require 'rails_helper'

RSpec.feature "ViewWidgets", type: :feature do
  scenario 'default view shows' do
    visit widget_index_path
    expect(page).to have_content I18n.t('super_terms_html', cronut_link: 'cronuts', donut_link: 'donuts')
  end

  scenario 'view page with english' do
    visit 'en/widget/index'
    expect(page).to have_content I18n.t('super_terms_html', cronut_link: 'cronuts', donut_link: 'donuts')
  end

  scenario 'view page with dutch' do
    visit 'nl/widget/index'
    expect(page).to have_content I18n.t('super_terms_html', locale: :nl, cronut_link: 'cronuts', donut_link: 'donuts')
  end
end
