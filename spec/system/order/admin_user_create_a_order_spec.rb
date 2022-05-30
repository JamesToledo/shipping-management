# frozen_string_literal: true

require 'rails_helper'

describe 'Admin user create a order' do
  it 'from the consult page' do
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
    expect(page).to have_button('Fazer Pedido')
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
    choose 'order[company_id]'
    click_on 'Fazer Pedido'

    expect(page).to have_css('h1', text: 'Endereço de Retirada')
    expect(current_path).to eq new_pickup_location_path
  end
end
