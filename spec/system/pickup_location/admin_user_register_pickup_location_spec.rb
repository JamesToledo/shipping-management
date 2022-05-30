# frozen_string_literal: true

require 'rails_helper'

describe 'admin user registers a pickup_location' do
  it 'and sees the form' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit new_pickup_location_path

    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Abreviação do Estado'
    expect(page).to have_field 'Bairro'
    expect(page).to have_field 'Rua'
    expect(page).to have_field 'Numero'
    expect(page).to have_field 'CEP'
    expect(page).to have_button 'cadastrar'
  end

  it 'successfully' do
    company = create(:company)
    create(:shipping_cust, value: 10, company_id: company.id)
    create(:budget, max_size: 0.500, max_weight: 15, range_price: 0.5, company_id: company.id)
    create(:deadline, max_space: 100, days: 2, company_id: company.id)
    location = create(:pickup_location)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit orders_path
    fill_in 'Altura', with: 0.5
    fill_in 'Largura', with: 0.2
    fill_in 'Comprimento', with: 0.35
    fill_in 'Peso', with: 12
    fill_in 'Distância', with: 73
    click_on 'Consultar'
    choose 'order[company_id]'
    click_on 'Fazer Pedido'
    fill_in 'Cidade', with: location.city
    fill_in 'Abreviação do Estado', with: location.state_abbr
    fill_in 'Bairro', with: location.district
    fill_in 'Rua', with: location.street
    fill_in 'Numero', with: location.number
    fill_in 'CEP', with: location.postal_code
    click_on 'cadastrar'

    expect(page).to have_css('h1', text: 'Informações do Destinatário')
    expect(current_path).to eq new_client_path
  end
end
