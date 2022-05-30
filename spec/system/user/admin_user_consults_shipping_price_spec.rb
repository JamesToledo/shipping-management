# frozen_string_literal: true

require 'rails_helper'

describe 'Admin user consults shipping price' do
  it 'user sees search form' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit user_root_path
    click_on 'Consultar Preços e Prazos'

    expect(page).to have_css('h1', text: 'Preecha os campos abaixo')
    expect(page).to have_field 'Altura'
    expect(page).to have_field 'Largura'
    expect(page).to have_field 'Comprimento'
    expect(page).to have_field 'Peso'
    expect(page).to have_field 'Distância'
    expect(page).to have_button 'Consultar'
    expect(page).to_not have_content 'Não há transportadoras disponíveis para essa consulta'
  end

  it 'successfully' do
    company = create(:company)
    create(:shipping_cust, value: 10, company_id: company.id)
    create(:budget, max_size: 0.500, max_weight: 15, range_price: 0.5, company_id: company.id)
    create(:deadline, max_space: 100, days: 2, company_id: company.id)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit orders_path
    fill_in 'Altura', with: 0.5
    fill_in 'Largura', with: 0.2
    fill_in 'Comprimento', with: 0.35
    fill_in 'Peso', with: 12
    fill_in 'Distância', with: 73
    click_on 'Consultar'

    expect(page).to have_css('h1', text: 'Transportadoras Disponíveis')
    expect(page).to have_content("R$ 36.5 - #{company.brand_name} - 2 dias úteis")
  end

  context 'when company is disabled' do
    it 'should not be listed' do
      create(:company)
      company = create(:company, status: 'disabled')
      create(:shipping_cust, value: 10, company_id: 1)
      create(:budget, max_size: 0.500, max_weight: 15, range_price: 0.5, company_id: 1)
      create(:deadline, max_space: 100, days: 2, company_id: 1)
      create(:shipping_cust, value: 10, company_id: 2)
      create(:budget, max_size: 0.500, max_weight: 15, range_price: 0.5, company_id: 2)
      create(:deadline, max_space: 100, days: 3, company_id: 2)
      admin = create(:user, email: 'admin@sistemadefrete.com')

      sign_in admin
      visit orders_path
      fill_in 'Altura', with: 0.5
      fill_in 'Largura', with: 0.2
      fill_in 'Comprimento', with: 0.35
      fill_in 'Peso', with: 12
      fill_in 'Distância', with: 73
      click_on 'Consultar'

      expect(page).to have_css('h1', text: 'Transportadoras Disponíveis')
      expect(page).to_not have_content("R$ 36.5 - #{company.brand_name} - 3 dias úteis")
    end
  end

  context 'when there are no results for consult' do
    it 'should return a message' do
      company = create(:company)
      create(:shipping_cust, value: 10, company_id: company.id)
      create(:budget, max_size: 0.500, max_weight: 15, range_price: 0.5, company_id: company.id)
      create(:deadline, max_space: 100, days: 2, company_id: company.id)
      admin = create(:user, email: 'admin@sistemadefrete.com')

      sign_in admin
      visit orders_path
      fill_in 'Altura', with: 30
      fill_in 'Largura', with: 20
      fill_in 'Comprimento', with: 1
      fill_in 'Peso', with: 200
      fill_in 'Distância', with: 1000
      click_on 'Consultar'

      expect(page).to have_content 'Não há transportadoras disponíveis para essa consulta'
    end
  end
end
