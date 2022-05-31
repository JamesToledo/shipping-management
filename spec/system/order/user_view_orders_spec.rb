# frozen_string_literal: true

require 'rails_helper'

describe 'User sees orders' do
  it 'and sees a list of orders of his company' do
    company = create(:company, brand_name: 'Transall')
    order = create(:order, company_id: company.id)
    other_company = create(:company, brand_name: 'Entregas fast')
    other_order = create(:order, status: 'accepted', company_id: other_company.id)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit user_root_path
    click_on 'Ordens de Serviço'

    expect(page).to have_content order.code
    expect(page).to have_content I18n.t(order.status)
    expect(page).to_not have_content other_order.code
    expect(page).to_not have_content I18n.t(other_order.status)
    expect(current_path).to eq list_orders_path
  end

  it 'and sees order details' do
    company = create(:company)
    order = create(:order, company_id: company.id)
    location = create(:pickup_location, order_id: order.id)
    client = create(:client, order_id: order.id)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit list_orders_path
    click_on 'detalhes'

    expect(page).to have_css('h1', text: "Ordem: #{order.code}")
    expect(page).to have_content "Status: #{I18n.t(order.status)}"
    expect(page).to have_content "Tamanho: #{order.height * order.width * order.length}m³"
    expect(page).to have_content "Peso: #{order.weight}"
    expect(page).to have_content "Retirada: #{location.makefull_address(location.city, location.state_abbr,
                                                                        location.district, location.street,
                                                                        location.number, location.postal_code)}"
    expect(page).to have_content "Entrega: #{client.makefull_address(client.city, client.state_abbr,
                                                                     client.district, client.street,
                                                                     client.number, client.postal_code)}"
    expect(page).to have_content "Destinatário: #{client.full_name}"
  end
end
