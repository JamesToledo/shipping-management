# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'shoulda_matchers' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:vehicle_make) }
      it { is_expected.to validate_presence_of(:vehicle_model) }
      it { is_expected.to validate_presence_of(:vehicle_plate) }
      it { is_expected.to validate_presence_of(:year) }
      it { is_expected.to validate_presence_of(:load_capacity) }
    end
  end
  describe '#valid' do
    context 'when receiving invalid parameters' do
      it 'false when vehicle_make is empty' do
        company = create(:company)
        vehicle = build(:vehicle, vehicle_make: '', company_id: company.id)

        expect(vehicle.valid?).to be false
      end

      it 'false when vehicle_model is empty' do
        company = create(:company)
        vehicle = build(:vehicle, vehicle_model: '', company_id: company.id)

        expect(vehicle.valid?).to be false
      end

      it 'false when load_capacity is empty' do
        company = create(:company)
        vehicle = build(:vehicle, load_capacity: '', company_id: company.id)

        expect(vehicle.valid?).to be false
      end

      it 'false when year is empty' do
        company = create(:company)
        vehicle = build(:vehicle, year: '', company_id: company.id)

        expect(vehicle.valid?).to be false
      end

      it 'false when vehicle_plate is empty' do
        company = create(:company)
        vehicle = build(:vehicle, vehicle_plate: '', company_id: company.id)

        expect(vehicle.valid?).to be false
      end

      it 'false when vehicle_plate already exists' do
        company = create(:company)
        vehicle = build(:vehicle, vehicle_plate: 'WET-7256', company_id: company.id)
        create(:vehicle, vehicle_plate: 'WET-7256', company_id: company.id)

        expect(vehicle.valid?).to be false
      end
    end

    context 'when receiving valid parameters' do
      it 'must be true' do
        company = create(:company)
        vehicle = build(:vehicle, company_id: company.id)

        expect(vehicle.valid?).to be true
      end
    end
  end
end
