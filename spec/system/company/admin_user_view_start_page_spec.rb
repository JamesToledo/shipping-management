# frozen_string_literal: true

require 'rails_helper'

describe 'Admin_User visit the start page' do
  it 'and sees the content' do
    company = create(:company)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit companies_path

    expect(page).to have_content 'Gerenciamento de Transportadoras'
    expect(page).to have_content company.brand_name
    expect(page).to have_content company.state_abbr
    expect(page).to have_content I18n.t(company.status)
  end

  it 'and there are no companies registered' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit companies_path

    expect(page).to have_content 'não há transportadoras cadastradas'
  end
end
