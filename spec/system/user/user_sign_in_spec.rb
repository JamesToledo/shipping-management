# frozen_string_literal: true

require 'rails_helper'

describe 'User authenticates' do
  it 'successfully' do
    user = create(:user)

    login(user)

    expect(page).to have_content 'Login efetuado com sucesso'
  end

  it 'and successfully logout' do
    user = create(:user)

    login(user)
    click_on 'Logout'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Logout efetuado com sucesso'
  end

  context 'when logged as admin' do
    it 'sees admin user contents' do
      admin = create(:user, email: 'admin@sistemadefrete.com')

      login(admin)

      expect(page).to have_content 'Login efetuado com sucesso'
      expect(page).to have_css('h1', text: "Boas Vindas #{admin.username}!")
      expect(page).to have_link 'Gerenciar Transportadoras'
      expect(page).to have_link 'Consultar Preços e Prazos'
      expect(current_path).to eq user_root_path
    end
  end

  context 'when logged as company_user' do
    it 'sees normal user contents' do
      company = create(:company)
      user = create(:user, email: "pedro@#{company.email_domain}", company_id: company.id)

      login(user)

      expect(page).to have_content 'Login efetuado com sucesso'
      expect(page).to have_css('h1', text: "Boas Vindas #{user.username}!")
      expect(page).to have_link 'Veículos'
      expect(page).to have_link 'Preços e Prazos'
      expect(page).to have_link 'Ordens de Serviço'
      expect(current_path).to eq user_root_path
    end
  end
end
