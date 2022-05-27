# frozen_string_literal: true

require 'rails_helper'

describe 'User sign up' do
  it 'successfully' do
    user  = build(:user)

    visit root_path
    click_on 'Login'
    click_on 'Inscrever-se'
    fill_in 'Nome de Usuário', with: user.username
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirme sua senha', with: user.password
    click_on 'cadastrar'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso'
    expect(current_path).to eq(user_root_path)
  end

  it 'and successfully logout' do
    user  = build(:user)

    visit root_path
    click_on 'Login'
    click_on 'Inscrever-se'
    fill_in 'Nome de Usuário', with: user.username
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirme sua senha', with: user.password
    click_on 'cadastrar'
    click_on 'Logout'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Logout efetuado com sucesso'
  end
end
