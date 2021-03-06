# frozen_string_literal: true

require 'rails_helper'

describe 'User registers vehicle' do
  it 'and sees vehicle register form' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit vehicles_path
    click_on 'cadastrar veiculos'

    expect(page).to have_css('h1', text: 'Cadastro de Veículos')
    expect(page).to have_field 'Marca do Veículo'
    expect(page).to have_field 'Placa do Veículo'
    expect(page).to have_field 'Modelo do Veículo'
    expect(page).to have_field 'Ano de Fabricação'
    expect(page).to have_field 'Carga Máxima'
    expect(page).to have_button 'cadastrar'
  end

  it 'successfully' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    vehicle = build(:vehicle, company_id: company.id)

    sign_in user
    visit vehicles_path
    click_on 'cadastrar veiculos'

    fill_in 'Marca do Veículo', with: vehicle.vehicle_make
    fill_in 'Modelo do Veículo', with: vehicle.vehicle_model
    fill_in 'Placa do Veículo', with: vehicle.vehicle_plate
    fill_in 'Ano de Fabricação', with: vehicle.year
    fill_in 'Carga Máxima', with: vehicle.load_capacity
    click_on 'cadastrar'

    expect(page).to have_content 'Veículo Cadastrado!'
    expect(current_path).to eq vehicle_path(1)
  end

  it 'with empty fields' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit vehicles_path
    click_on 'cadastrar veiculos'

    fill_in 'Marca do Veículo', with: ''
    fill_in 'Carga Máxima', with: ''
    click_on 'cadastrar'

    expect(page).to have_content 'Veículo não Cadastrado'
    expect(page).to have_content 'Marca do Veículo não pode ficar em branco'
    expect(page).to have_content 'Carga Máxima não pode ficar em branco'
    expect(current_path).to eq vehicles_path
  end

  it 'and can cancel' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit new_vehicle_path
    click_on 'cancelar'

    expect(current_path).to eq vehicles_path
  end
end
