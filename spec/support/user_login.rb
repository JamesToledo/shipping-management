# frozen_string_literal: true

def login(user)
  visit root_path
  click_on 'Login'
  within 'form' do
    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Login'
  end
end
