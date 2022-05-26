# frozen_string_literal: true

require 'rails_helper'

describe 'User visit quotes page' do
  it 'and there are no budgets and deadlines registered' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit user_root_path
    click_on 'Preços e Prazos'

    expect(page).to have_css('h1', text: 'Preços')
    expect(page).to have_css('h1', text: 'Prazos')
    expect(page).to have_link 'Cadastrar Preços'
    expect(page).to have_link 'Cadastrar Prazos'
    expect(page).to have_content 'Não há preços cadastrados'
    expect(page).to have_content 'Não há prazos cadastrados'
  end
  it 'and there is a list of budgets' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    budget = create(:budget, company_id: company.id)

    sign_in user
    visit quotes_path

    expect(page).to have_content 'Metros Cúbicos'
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Valor por Km'
    expect(page).to have_content budget.row_generator(budget.min_size, budget.max_size)
    expect(page).to have_content budget.row_generator(budget.min_weight, budget.max_weight)
    expect(page).to have_content "R$ #{budget.range_price}"
  end
end
