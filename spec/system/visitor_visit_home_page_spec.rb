# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor visit home page' do
  it 'and sees its content' do
    visit root_path

    expect(page).to have_css('h1', text: 'Sistema de Entregas')
    expect(page).to have_field 'Buscar Pedido'
    expect(page).to have_button 'buscar'
  end

  it 'and successfully search for a order' do
    company = create(:company)
    order = create(:order, company_id: company.id)
    create(:pickup_location, order_id: order.id)
    create(:client, order_id: order.id)

    visit root_path
    fill_in 'Buscar Pedido', with: order.code
    click_on 'buscar'

    expect(page).to have_css('h1', text: 'Resultados da Busca')
    expect(page).to have_content "Pedido: #{order.code}"
    expect(page).to have_content "Status: #{I18n.t(order.status)}"
  end

  it 'and there are no results' do
    visit root_path
    fill_in 'Buscar Pedido', with: 'L5ATQZRJ29MIQPV'
    click_on 'buscar'

    expect(page).to have_content 'Insira um código válido'
  end
end
