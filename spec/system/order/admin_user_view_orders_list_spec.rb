# frozen_string_literal: true

require 'rails_helper'

describe 'user sees a list of Orders' do
  it 'from the start page' do
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit user_root_path
    click_on 'Ordens de Serviço'

    expect(current_path).to eq list_orders_path
    expect(page).to have_css('h1', text: 'Ordens de Serviço')
  end

  it 'successfully' do
    order = create(:order)
    admin = create(:user, email: 'admin@sistemadefrete.com')

    sign_in admin
    visit list_orders_path

    expect(page).to have_content order.code
    expect(page).to have_content I18n.t(order.status)
  end
end
