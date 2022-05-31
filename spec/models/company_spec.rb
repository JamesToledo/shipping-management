# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'shoulda_matchers' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:brand_name) }
      it { is_expected.to validate_presence_of(:corporate_name) }
      it { is_expected.to validate_presence_of(:registration_number) }
      it { is_expected.to validate_presence_of(:address) }
      it { is_expected.to validate_presence_of(:email_domain) }
      it { is_expected.to validate_presence_of(:postal_code) }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:registration_number).is_equal_to(14) }
      it { is_expected.to validate_length_of(:postal_code).is_equal_to(8) }
    end

    context 'uniquiness' do
      it { should validate_uniqueness_of(:registration_number) }
      it { should validate_uniqueness_of(:email_domain) }
    end
  end
  describe '#valid' do
    context 'when receiving invalid parameters' do
      it 'false when brand_name is empty' do
        company = build(:company, brand_name: '')

        expect(company.valid?).to be false
      end

      it 'false when corporate_name is empty' do
        company = build(:company, corporate_name: '')

        expect(company.valid?).to be false
      end

      it 'false when registration_number is empty' do
        company = build(:company, registration_number: '')

        expect(company.valid?).to be false
      end

      it 'false when address is empty' do
        company = build(:company, address: '')

        expect(company.valid?).to be false
      end

      it 'false when email_domain is empty' do
        company = build(:company, email_domain: '')

        expect(company.valid?).to be false
      end

      it 'false when postal_code is empty' do
        company = build(:company, postal_code: '')

        expect(company.valid?).to be false
      end

      it 'false when registration_number already exists' do
        company = build(:company, registration_number: '43991105000162')
        create(:company, registration_number: '43991105000162')

        expect(company.valid?).to be false
      end

      it 'false when email_domain already exists' do
        company = build(:company, email_domain: 'entregasfast.com')
        create(:company, email_domain: 'entregasfast.com')

        expect(company.valid?).to be false
      end
    end

    context 'when receiving valid parameters' do
      it 'must be true' do
        company = build(:company)

        expect(company.valid?).to be true
      end
    end
  end
end
