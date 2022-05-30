# frozen_string_literal: true

require 'rails_helper'

describe 'admin user registers client' do
  it 'and sees form' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit new_client_path

    expect(page).to have_field 'Nome Completo'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Abreviação do Estado'
    expect(page).to have_field 'Bairro'
    expect(page).to have_field 'Rua'
    expect(page).to have_field 'Numero'
    expect(page).to have_field 'CEP'
    expect(page).to have_button 'cadastrar'
  end

  it 'successfully' do
    order = create(:order)
    location = create(:pickup_location)
    client = create(:client)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit new_pickup_location_path(order_id: order.id, city: location.city, state_abbr: location.state_abbr,
                                   district: location.district, street: location.street, number: location.number,
                                   postal_code: location.postal_code)
    click_on 'cadastrar'
    fill_in 'Nome Completo', with: client.full_name
    fill_in 'Cidade', with: client.city
    fill_in 'Abreviação do Estado', with: client.state_abbr
    fill_in 'Bairro', with: client.district
    fill_in 'Rua', with: client.street
    fill_in 'Numero', with: client.number
    fill_in 'CEP', with: client.postal_code
    click_on 'cadastrar'

    expect(current_path).to eq list_orders_path
  end
end
