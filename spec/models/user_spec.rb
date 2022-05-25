# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User authenticates' do
    it 'as admin' do
      admin = User.create!(username: 'admin', email: 'admin@sistemadefrete.com', password: 'Admin123')

      expect(admin.role).to eq 'admin'
    end

    it 'as company_user' do
      company = create(:company)
      user = User.create!(username: 'Pedro', email: "pedro@#{company.email_domain}", password: 'Pedro123', role: 1)

      expect(user.role).to eq 'company_user'
    end
  end
end
