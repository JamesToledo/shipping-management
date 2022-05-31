# frozen_string_literal: true

require 'rails_helper'

describe 'User edits order status' do
  it 'from the details page' do
    company = create(:company)
    order = create(:order, company_id: company.id)
    create(:pickup_location, order_id: order.id)
    create(:client, order_id: order.id)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit list_orders_path
    click_on 'detalhes'
    click_on 'atualizar'

    expect(current_path).to eq edit_order_path(order.id)
    expect(page).to have_css('h1', text: 'Atualizar pedido')
    expect(page).to have_select 'Status'
    expect(page).to have_content('Atribuír um veículo:')
  end

  it 'and binds a vehicle successfully' do
    company = create(:company)
    order = create(:order, company_id: company.id)
    create(:pickup_location, order_id: order.id)
    create(:client, order_id: order.id)
    vehicle = create(:vehicle, company_id: company.id)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit edit_order_path(order.id)
    select 'Aceito', from: 'Status'
    select vehicle.vehicle_model, from: 'Veículo'
    click_on 'atualizar'

    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content 'Status Atualizado!'
    expect(page).to have_content 'Status: Aceito'
    expect(page).to have_content "Veículo: #{vehicle.vehicle_model}"
  end

  context 'when the status is different from pending' do
    it 'vehicle selection should not appear' do
      company = create(:company)
      order = create(:order, status: 'cancelled', company_id: company.id)
      create(:pickup_location, order_id: order.id)
      create(:client, order_id: order.id)
      create(:vehicle, company_id: company.id)
      user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

      sign_in user
      visit edit_order_path(order.id)

      expect(page).to_not have_content('Atribuír um veículo:')
    end
  end
end
