# frozen_string_literal: true

require 'rails_helper'

describe 'admin user sees company details' do
  it 'from the admin home page' do
    company = create(:company)

    visit companies_path
    click_on company.brand_name

    expect(current_path).to eq(company_path(1))
    expect(page).to have_css('h1', text: company.brand_name)
    expect(page).to have_content "Razão Social: #{company.corporate_name}"
    expect(page).to have_content "CNPJ: #{company.registration_number}"
    expect(page).to have_content "Endereço: #{company.address} - #{
                                  company.state_abbr}, #{company.postal_code}"
    expect(page).to have_content "Status: #{I18n.t(company.status)}"
  end

  it 'and return to admin home page' do
    company = create(:company)

    visit companies_path
    click_on company.brand_name
    click_on 'voltar'

    expect(current_path).to eq companies_path
  end
end
