# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor sees home page' do
  it 'and sees the tittle' do
    visit root_path

    expect(page).to have_css('h1', text: 'Sistema de Entregas')
  end
end
