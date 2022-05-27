# frozen_string_literal: true

require 'rails_helper'

describe 'admin user edits a company' do
  it 'and see the edit form' do
    company = create(:company)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit company_path(1)
    click_on 'editar'

    expect(page).to have_content 'Editar Transportadora'
    expect(page).to have_field('Nome da Marca', with: company.brand_name)
    expect(page).to have_field('Razão Social', with: company.corporate_name)
    expect(page).to have_field('CNPJ', with: company.registration_number)
    expect(page).to have_field('Endereço', with: company.address)
    expect(page).to have_field('Domínio do Email', with: company.email_domain)
    expect(page).to have_field('CEP', with: company.postal_code)
    expect(page).to have_field('Abreviação do Estado', with: company.state_abbr)
  end

  it 'successfully' do
    create(:company)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit company_path(1)
    click_on 'editar'
    fill_in 'Nome da Marca', with: 'EcoFort'
    click_on 'atualizar'

    expect(page).to have_content 'Transportadora Atualizada!'
  end

  it 'with invalid parameters' do
    create(:company)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit company_path(1)
    click_on 'editar'
    fill_in 'Nome da Marca', with: ''
    click_on 'atualizar'

    expect(page).to have_content 'Editar Transportadora'
    expect(page).to have_content 'Transportadora não Atualizada'
    expect(page).to have_content 'Nome da Marca não pode ficar em branco'
  end
end
