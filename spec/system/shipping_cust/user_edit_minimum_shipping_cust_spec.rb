# frozen_string_literal: true

require 'rails_helper'

describe 'User edit minimum shipping cost' do
  it 'successfully' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    create(:shipping_cust, company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Editar Valor'
    fill_in 'Frete Mínimo', with: 11
    click_on 'atualizar'

    expect(page).to have_content 'Valor Salvo!'
    expect(current_path).to eq quotes_path
    expect(page).to have_content 'R$ 11.0'
  end

  it 'with empty fields' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    create(:shipping_cust, company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Editar Valor'
    fill_in 'Frete Mínimo', with: ''
    click_on 'atualizar'

    expect(page).to have_content 'Valor não Editado'
    expect(page).to have_content 'Frete Mínimo não pode ficar em branco'
  end
end
