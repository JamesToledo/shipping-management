# frozen_string_literal: true

require 'rails_helper'

describe 'User sees vehicles list' do
  it 'from the start page' do
    company = create(:company)
    vehicle = create(:vehicle, company_id: company.id)

    visit vehicles_path

    expect(page).to have_content 'Veículos Disponíveis'
    expect(page).to have_content vehicle.vehicle_model
    expect(page).to have_content "#{vehicle.load_capacity}Kg"
  end

  it 'and sees vehicles details' do
    company = create(:company)
    vehicle = create(:vehicle, company_id: company.id)

    visit vehicles_path
    click_on vehicle.vehicle_model

    expect(page).to have_css('h1', text: "#{vehicle.vehicle_make} #{vehicle.vehicle_model}")
    expect(page).to have_content "Placa: #{vehicle.vehicle_plate}"
    expect(page).to have_content "Ano: #{vehicle.year}"
    expect(page).to have_content "Capacidade de Carga: #{vehicle.load_capacity}Kg"
  end

  it 'and can go back' do
    company = create(:company)
    vehicle = create(:vehicle, company_id: company.id)

    visit vehicles_path
    click_on vehicle.vehicle_model
    click_on 'Voltar'

    expect(current_path).to eq vehicles_path
  end
end
