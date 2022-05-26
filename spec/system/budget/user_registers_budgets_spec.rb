# frozen_string_literal: true

require 'rails_helper'

describe 'User registers a budget' do
  it 'user sees registers form page' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit user_root_path
    click_on 'Preços e Prazos'
    click_on 'Cadastrar Preços'

    expect(page).to have_css('h1', text: 'Cadastrar intervalo de preço')
    expect(page).to have_field 'Tamanho Mínimo'
    expect(page).to have_field 'Valor por Km'
    expect(page).to have_button 'cadastrar'
  end
  it 'Successfully' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    budget = build(:budget)

    sign_in user
    visit user_root_path
    click_on 'Preços e Prazos'
    click_on 'Cadastrar Preços'
    fill_in 'Tamanho Mínimo', with: budget.min_size
    fill_in 'Tamanho Máximo', with: budget.max_size
    fill_in 'Peso Mínimo', with: budget.min_weight
    fill_in 'Peso Máximo', with: budget.max_weight
    fill_in 'Valor por Km', with: budget.range_price
    click_on 'cadastrar'

    expect(page).to have_content 'Intervalo Cadastrado!'
    expect(current_path).to eq quotes_path
  end

  it 'and can cancel' do
    visit new_budget_path
    click_on 'cancelar'

    expect(current_path).to eq quotes_path
  end
end
