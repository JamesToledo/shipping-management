# frozen_string_literal: true

describe 'Admin_User visit the start page' do
  it 'and sees the content' do
    company =  create(:company)

    visit company_index_path

    expect(page).to have_content 'Gerenciamento de Transportadoras'
    expect(page).to have_content company.brand_name
    expect(page).to have_content company.state_abbr
  end

  it 'and there are no companies registered' do
    visit company_index_path

    expect(page).to have_content 'não há transportadoras cadastradas'
  end
end
