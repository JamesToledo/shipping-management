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
end
