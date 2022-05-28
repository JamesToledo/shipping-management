# frozen_string_literal: true

require 'rails_helper'

describe 'User sets deadline' do
  it 'user sees the form' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit quotes_path
    click_on 'Cadastrar Prazos'

    expect(page).to have_css('h1', text: 'Definir intervalo de prazos')
    expect(page).to have_field 'Início'
    expect(page).to have_field 'Final'
    expect(page).to have_field 'Dias Úteis'
    expect(page).to have_button 'cadastrar'
  end

  it 'successfully' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)
    deadline = build(:deadline)

    sign_in user
    visit new_deadline_path
    fill_in 'Início', with: deadline.min_space
    fill_in 'Final', with: deadline.max_space
    fill_in 'Dias Úteis', with: deadline.days
    click_on 'cadastrar'

    expect(current_path).to eq quotes_path
    expect(page).to have_content 'Prazo Salvo!'
  end

  it 'with empty fields' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit vehicles_path
    click_on 'cadastrar veiculos'

    sign_in user
    visit new_deadline_path
    fill_in 'Início', with: ''
    fill_in 'Dias Úteis', with: ''
    click_on 'cadastrar'

    expect(page).to have_content 'Prazo não Salvo'
    expect(page).to have_content 'Início não pode ficar em branco'
    expect(page).to have_content 'Dias Úteis não pode ficar em branco'
    expect(current_path).to eq deadlines_path
  end

  it 'and can cancel' do
    company = create(:company)
    user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

    sign_in user
    visit new_deadline_path
    click_on 'cancel'

    expect(current_path).to eq quotes_path
  end
end
