# frozen_string_literal: true

require 'rails_helper'

describe 'User authenticates' do
  it 'successfully' do
    user = create(:user)

    visit root_path
    click_on 'Login'
    within 'form' do
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: user.password
      click_on 'Login'
    end

    expect(page).to have_content 'Login efetuado com sucesso'
  end

  it 'and successfully logout' do
    user = create(:user)

    visit root_path
    click_on 'Login'
    within 'form' do
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: user.password
      click_on 'Login'
    end
    click_on 'Logout'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Logout efetuado com sucesso'
  end

  # context 'when logged as admin' do
  #   it 'is directed to the company listing page' do
  #     admin = User.create!(username: 'admin', email: 'admin@sistemadefrete.com', password: 'Admin123')

  #     visit root_path
  #     click_on 'Login'
  #     within 'form' do
  #       fill_in 'E-mail', with: admin.email
  #       fill_in 'Senha', with: admin.password
  #       click_on 'Login'
  #     end

  #     expect(page).to have_content 'Login efetuado com sucesso'
  #     expect(current_path).to eq companies_path
  #   end
  # end

  # context 'when logged as company_user' do
  #   it 'is directed to the company details page' do
  #     company = create(:company)
  #     user = User.create!(username: 'Pedro', email: "pedro@#{company.email_domain}", password: 'Pedro123')

  #     visit root_path
  #     click_on 'Login'
  #     within 'form' do
  #       fill_in 'E-mail', with: user.email
  #       fill_in 'Senha', with: user.password
  #       click_on 'Login'
  #     end

  #     expect(page).to have_content 'Login efetuado com sucesso'
  #     expect(current_path).to eq company_user_path
  #   end
  # end
end
