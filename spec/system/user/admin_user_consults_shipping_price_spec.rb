# frozen_string_literal: true

require 'rails_helper'

describe 'Admin user consults shipping price' do
  it 'user sees search form' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit user_root_path
    click_on 'Consultar Preços e Prazos'

    expect(page).to have_css('h1', text: 'Preecha os campos abaixo')
    expect(page).to have_content 'Altura'
    expect(page).to have_content 'Largura'
    expect(page).to have_content 'Comprimento'
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Distância'
    expect(page).to have_button 'Consultar'
  end
end
