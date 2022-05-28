# frozen_string_literal: true

require 'rails_helper'

describe 'User sets minimum shipping cost' do
  it 'user sees the register form' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Definir Valor'

    expect(page).to have_css('h1', text: 'Definir Valor')
  end

  it 'successfully' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    cust = build(:shipping_cust)

    sign_in user
    visit quotes_path
    click_on 'Definir Valor'
    fill_in 'Frete Mínimo', with: cust.value
    click_on 'cadastrar'

    expect(page).to have_content 'Valor Salvo!'
    expect(current_path).to eq quotes_path
    expect(page).to have_content "R$ #{cust.value}"
  end

  it 'with empty fields' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Definir Valor'
    fill_in 'Frete Mínimo', with: ''
    click_on 'cadastrar'

    expect(page).to have_content 'Valor não Salvo'
    expect(page).to have_content 'Frete Mínimo não pode ficar em branco'
  end

  it 'and can cancel' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Definir Valor'
    click_on 'cancelar'

    expect(current_path).to eq quotes_path
  end
end
