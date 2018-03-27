require 'rails_helper'

RSpec.feature "ViewWidgets", type: :feature do
  scenario 'default view shows' do
    visit widget_index_path
    expect(page).to have_content I18n.t('super_terms_html', cronut_link: 'cronuts', donut_link: 'donuts')
  end
end
