# frozen_string_literal: true

require 'rails_helper'

describe 'Admin_User register company' do
  it 'Admin_User sees the registration form' do
    visit companies_path
    click_on 'Nova Transportadora'

    expect(page).to have_content 'Cadastro de Transportadora'
    expect(page).to have_field('Nome da Marca')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Domínio do Email')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Abreviação do Estado')
  end

  it 'and successfully register' do
    c = build(:company)

    visit new_company_path
    fill_in 'Nome da Marca', with: c.brand_name
    fill_in 'Razão Social', with: c.corporate_name
    fill_in 'CNPJ', with: c.registration_number
    fill_in 'Endereço', with: c.address
    fill_in 'Domínio do Email', with: c.email_domain
    fill_in 'CEP', with: c.postal_code
    fill_in 'Abreviação do Estado', with: c.state_abbr
    click_on 'cadastrar'

    expect(current_path).to eq companies_path
    expect(page).to have_content 'Transportadora Cadastrada!'
    expect(page).to have_content c.brand_name
    expect(page).to have_content c.state_abbr
  end

  it 'with empty fields' do
    visit new_company_path
    fill_in 'Nome da Marca', with: ''
    fill_in 'Domínio do Email', with: ''
    fill_in 'CEP', with: ''
    fill_in 'Abreviação do Estado', with: ''
    click_on 'cadastrar'

    expect(current_path).to eq companies_path
    expect(page).to have_content 'Transportadora não cadastrada'
    expect(page).to have_content 'Nome da Marca não pode ficar em branco'
    expect(page).to have_content 'Domínio do Email não pode ficar em branco'
    expect(page).to have_content 'CEP não pode ficar em branco'
    expect(page).to have_content 'Abreviação do Estado não pode ficar em branco'
  end

  it 'and can cancel' do
    visit new_company_path
    click_on 'cancelar'

    expect(current_path).to eq companies_path
  end
end
