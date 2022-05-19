# frozen_string_literal: true

require 'rails_helper'

describe 'Admin_User register company' do
  it 'Admin_User sees the registration form' do
    visit company_index_path
    within('nav') do
      click_on 'Nova Transportadora'
    end
    expect(page).to have_content 'Cadastro de Transportadora'
    expect(page).to have_field('Nome da Marca')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Domínio do Email')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Abreviação do Estado')
  end
end
