# frozen_string_literal: true

require 'rails_helper'

describe 'admin user change company status' do
  it 'admin user disables a company' do
    company = create(:company)

    visit edit_company_path(company.id)
    select 'desativo', from: 'Status'
    click_on 'atualizar'

    expect(Company.find(1).status).to eq 'disabled'
  end
end
